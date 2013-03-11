package fr.isima

import grails.test.mixin.*
import org.junit.*

import fr.isima.exception.PostException

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(AnswerController)
@Mock([Tag, Question, Answer, Contributor, PostHistory, Award])
class AnswerControllerTests {

  def user
  def tag
  def question
  def a
  def springSecurityService

  void setUp() {
    
    /* Create a mock SpringSecurityService with juste one method. */
    springSecurityService = new Object()
    springSecurityService.metaClass.getCurrentUser = { user }

    defineBeans {

      postService(PostService) { bean ->
        bean.autowire = true
      }

      postHistoryService(PostHistoryService)

      awardService(AwardService) { bean ->
        bean.autowire = true
      }
    }
    
    /* Give the mock SpringSecurityService to the PostService. */
    controller.postService.springSecurityService = springSecurityService
    
    Contributor.metaClass.encodePassword = { -> }

    user = new Contributor(username: "Toto", password: "fffffff", email: "", location: "", birthDate: new Date(), isAdmin: true, enabled: true)
    user.save(flush: true)
    
    tag = new Tag(name: "XML", description: "")
    tag.save(flush: true)
    
    question = new Question(title: "a", content: "a", tags: [tag], contributor: user, editionContributor: user)
    question.save(flush: true)
    
    a = new Answer(content: "a", question: question, contributor: user, editionContributor: user)
    a.save(flush: true)
  }

  void testSaveOk() {

    params.content = "a"
    params.idQ = 1
    
    controller.save()   
  }

  void testSaveFail() {

    params.content = ""
    params.idQ = 1
    
    shouldFail(PostException) {
      controller.save()   
    }
  }
  
  void testUpdateOk() {
        
    params.id = 1
    controller.update()
    
    assert response.redirectedUrl == "/question/display/1"
  }

  void testUpdateFail() {
    
    params.id = 1
    params.content = ""
    controller.update()
    
    assert view == '/answer/edit'
    assert model.answer == a
  }

  void testDeleteOk() {
   
    params.id = 1
    controller.delete()
    
    assert response.redirectedUrl == "/question/display/1"
  }
}
