package fr.isima

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class QuestionController {

  def postService
  def questionService
  def springSecurityService

  def display = {

    def question = Question.get(params.id)

    questionService.incViewCpt(question)		
    [question: question]
  }

  @Secured(['IS_AUTHENTICATED_FULLY'])
  def create = {

    render view: 'new', model: [tags: Tag.json(), locality: "ask"]
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

  def save = {

    def question = null
    def title = params.title
    def content = params.content
    def tagsId = params.tagsId	
    def tagIds = []
    def tags = []
    def view = null
   
    if (tagsId != "") {
      tagsId.split(";").each { id ->

        tags.add(Tag.get(id))
        tagIds.add(id);
      }
    }

    /* If the question is in DB. */
    if (params.id != null) {
      
      question = Question.get(params.id)
      
      question.title   = title
      question.content = content
      question.tags    = tags
      
      question.lastEditionDate = new Date()

      view = 'edit'
    }
    else {

      question = new Question(title: title, content: content, tags: tags, contributor: getAuthenticatedUser());
      
      view = 'new'
    }

    try {
    
      questionService.save(question)			
      redirect action: "display", id: question.id
    }
    catch (e) {

      render view: view, model: [question: question, tags: Tag.json(),
                                 tagIds: tagIds
                                ]
    }
  }
}
