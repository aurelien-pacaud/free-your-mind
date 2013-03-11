package fr.isima

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Answer)
@Mock([Contributor, Question, Answer, Comment, PostHistory, Tag, Award])
class AnswerTests {

  def answer
  def user
  def tag
  def q
  def c
  
  void setUp() {
  
    Contributor.metaClass.encodePassword = { -> }

    mockForConstraintsTests(Answer)

    user = new Contributor(username: "Toto", password: "fffffff", email: "", location: "", birthDate: new Date(), isAdmin: true, enabled: true)
    user.save(flush: true)
    
    tag = new Tag(name: "XML", description: "")
    tag.save(flush: true)
    
    q = new Question(title: "a", content: "a", tags: [tag], contributor: user, editionContributor: user)
    q.save(flush: true)

    c = new Comment(content: "a", post: q, contributor: user, editionContributor: user)
    c.save(flush: true)
    
    answer = new Answer(content: "a", question: q, contributor: user, editionContributor: user)
  }

  void testBlankContent() {
    
    answer.content = ""

    assertFalse answer.validate()
    assert "blank" == answer.errors['content']
  }

  void testNullableContent() {
    
    answer.content = null

    assertFalse answer.validate()
    assert "nullable", answer.errors['content']
  }
}
