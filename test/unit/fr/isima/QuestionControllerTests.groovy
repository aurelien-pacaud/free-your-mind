package fr.isima

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(QuestionController)
@Mock([Tag, Question, Answer, Contributor])
class QuestionControllerTests {

  def user
  def tag
  def question

  void setUp() {
    
    defineBeans {

      questionService(QuestionService)
      postService(PostService)
    }
    
    Contributor.metaClass.encodePassword = { -> }

    user = new Contributor(username: "Toto", password: "fffffff", email: "", location: "", birthDate: new Date(), isAdmin: true, enabled: true)
    user.save(flush: true)
    
    tag = new Tag(name: "XML", description: "")
    tag.save(flush: true)
    
    question = new Question(title: "a", content: "a", tags: [tag], contributor: user, editionContributor: user)
    question.save(flush: true)
  }

  void testDisplayNotFound() {
    
    params.id = 2
    controller.display()

    assert view == '/question/error404'
  }

  void testDisplayOk() {
        
    params.id = 1
    controller.display()
    
    assert view == '/question/display'
    assert model.question == question
  }

  void testLock() {
    
    params.id = 1
    controller.lock()
    
    assert response.redirectedUrl == "/question/display/1"
  }

  void testUnlock() {
    
    params.id = 1
    controller.unlock()
    
    assert response.redirectedUrl == "/question/display/1"
  }

}
