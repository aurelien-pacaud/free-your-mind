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
    [question: question, user: getAuthenticatedUser()]
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

  def add = {

    def title = params.title
    def content = params.content
    def tagsId = params.tagsId	
    def tagIds = []
    def tags = []

    if (tagsId != "") {
      tagsId.split(";").each { id ->

        tags.add(Tag.get(id))
        tagIds.add(id);
      }
    }

    log.info tags	
    def question = new Question(title: title, content: content, tags: tags, 
    contributor: getAuthenticatedUser());

    try {
      questionService.create(question)			
      redirect action: "display", id: question.id
    }
    catch (e) {
      render view: 'new', model: [question: question, tags: Tag.json(), 
      tagIds: tagIds]
    }
  }

  def update = {

    def title = params.title
    def content = params.content
    def tagsId = params.tagsId	
    def tagIds = []
    def tags = []

    if (tagsId != "") {
      tagsId.split(";").each { id ->

        tags.add(Tag.get(id))
        tagIds.add(id);
      }
    }

    log.info tags
    println params.id
    def question = Question.get(params.id)

    question.title   = title
    question.content = content
    question.tags    = tags

    try {
      questionService.update(question)			
      redirect action: "display", id: question.id
    }
    catch (e) {
      println e
      render view: 'edit', model: [question: question, tags: Tag.json(), 
      tagIds: tagIds]
    }
  }
}
