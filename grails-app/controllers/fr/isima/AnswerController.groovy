package fr.isima

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import fr.isima.exception.PostException

class AnswerController {

  def postService

  /**
   * Method used to add/update a new answer for a question.
   */
  def update = {

    def answer = Answer.get(params.id)

    answer.properties = params

    try {

      postService.update(answer)
      
      flash.message = "Answer edit with success!"
      redirect action: "display", controller: "question", id: answer.question.id
    }
    catch (e) {

      log.error e
      render view: 'edit', model: [answer: answer]
    }
  }

  def save = {
    
    def answer = new Answer(content: params.content, question: Question.get(params.idQ))
    log.info params
  
    try {
    
      postService.save(answer, PostType.ANSWERED)			
      //redirect controller: "question", action: "display", id: params.idQ
    }
    catch (e) {

      throw new PostException("Answer can ben saved")
    }
  }

  @Secured(['IS_AUTHENTICATED_FULLY'])
  def edit = {

    def answer = Answer.get(params.id)

    render view: 'edit', model: [answer: answer]
  }

  def delete = {

    def answer   = Answer.get(params.id)
    def question = answer.question

    postService.delete(answer)

    flash.message = "Answer deleted with success!"
    redirect action: "display", controller: "question", id: question.id
  }
}
