package fr.isima

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class AnswerController {

  def answerService

  /**
   * Method used to add/update a new answer for a question.
   */
  def save = {

    def answer = Answer.get(params.id)
    def action = null

    if (answer != null) {
   
      answer.content = params.content
      action = 'edit'
    }
    else {

      answer = new Answer(content: params.content, question: Question.get(params.idQ), contributor: getAuthenticatedUser())

      action = 'new'
    }

    try {

      answerService.save(answer)

      if(action == 'new')
        render template: '/post/postTemplate', collection: Question.get(params.idQ).answers, var: 'post' 
      else
        redirect action: 'display', controller: 'question', id: answer.question.id
    }
    catch (e) {
      render view: 'edit', model: [answer: answer]
    }
  }

  @Secured(['IS_AUTHENTICATED_FULLY'])
  def edit = {

    def answer = Answer.get(params.id)

    render view: 'edit', model: [answer: answer]
  }
}
