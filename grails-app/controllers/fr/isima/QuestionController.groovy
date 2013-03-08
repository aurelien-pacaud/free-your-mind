package fr.isima

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class QuestionController {

  def postService
  def questionService

  def tagSep = ";"

  def list(Integer max) {

    params.max = Math.min(max ?: 3, 10)

    [questions: Question.list(params), questionsCount: Question.count()]
  }
  
  def display = {

    def question = Question.get(params.id)

    if (question != null) {

      questionService.incViewCpt(question)		
      render view: "display", model: [question: question]
    }
    else 
      render view: "error404"
  }

  @Secured(['IS_AUTHENTICATED_FULLY'])
  def create = {
    render view: 'new', model: [tags: Tag.json()]
  }

  @Secured(['IS_AUTHENTICATED_FULLY'])
  def edit = {

    def question = Question.get(params.id)
    def tagIds = []

    question.tags.each{ tag ->
      tagIds.add(tag.id);
    }

    render view: 'edit', model: [question: question, tags: Tag.json(), tagIds: tagIds]
  }

  def update = {

    def question = Question.get(params.id)
      
    question.properties = params
    question.tags       = Tag.getAll(params.tagsId.tokenize(tagSep))

    try {
    
      postService.update(question)			
      
      flash.message = message(code: "fr.isima.Post.edition.success", args: [message(code: "fr.isima.Question.name")])
      redirect action: "display", id: question.id
    }
    catch (e) {

      log.error e

      render view: "edit", model: [question: question, tags: Tag.json(), tagIds: params.tagsId.tokenize(tagSep)]
    }

  }

  def save = {

    def question = null
    def title = params.title
    def content = params.content
    def tagsId = params.tagsId	
    def tags = Tag.getAll(tagsId.tokenize(tagSep))

    question = new Question(title: title, content: content, tags: tags);
    
    try {
    
      postService.save(question, PostType.ASKED)			
      
      flash.message = message(code: "fr.isima.Post.creation.success", args: [message(code: "fr.isima.Question.name")])
      redirect action: "display", id: question.id
    }
    catch (e) {

      log.error e

      render view: "new", model: [question: question, tags: Tag.json(), tagIds: tagsId.tokenize(tagSep)]
    }
  }

  def delete = {

    postService.delete(Question.get(params.id)) 
    redirect action: "index", controller: "index"
  }

  def lock = {

    def question = Question.get(params.id)
    questionService.lock(question)
    
    redirect action: "display", id: question.id
  }
  
  def unlock = {

    def question = Question.get(params.id)
    questionService.unlock(question)
    
    redirect action: "display", id: question.id
  }

  def votedAnswers() {
    
    def question = Question.get(params.id)
    def answers  = Answer.findAllByQuestion(question, [sort: 'mark', order:'desc'])

    render template: '/post/postTemplate', var: 'post', collection: answers
  }
  
  def latestAnswers() {
    
    def question = Question.get(params.id)
  
    render template: '/post/postTemplate', var: 'post', collection: question.answers
  }

}
