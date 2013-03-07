package fr.isima

import fr.isima.exception.PostException

@TestFor(PostService)
@Mock([Contributor, Question, Answer, Comment, PostHistory, Tag, Award])
class PostServiceTests {
  
  def springSecurityService
  def user
  def tag
  def q
  def a
  def c
  
  void setUp() {
   
    /* Create a mock SpringSecurityService with juste one method. */
    springSecurityService = new Object()
    springSecurityService.metaClass.getCurrentUser = { user }
    
    defineBeans {

      postHistoryService(PostHistoryService)
      awardService(AwardService)
    }
    
    Contributor.metaClass.encodePassword = { -> }

    /* Give the mock SpringSecurityService to the PostService. */
    service.springSecurityService = springSecurityService

    user = new Contributor(username: "Toto", password: "fffffff", email: "", location: "", birthDate: new Date(), isAdmin: true, enabled: true)
    user.save(flush: true)
    
    tag = new Tag(name: "XML", description: "")
    tag.save(flush: true)
    
    q = new Question(title: "a", content: "a", tags: [tag], contributor: user, editionContributor: user)
    q.save(flush: true)

    a = new Answer(content: "a", question: q, contributor: user, editionContributor: user)
    a.save(flush: true)
    
    c = new Comment(content: "a", post: q, contributor: user, editionContributor: user)
    c.save(flush: true)
  }

  /*--------------------------------------------*/
  /*                 Question                   */
  /*--------------------------------------------*/
  void testQuestionCreateOk() {			
    
    def question = new Question(title: "a", content: "a", tags: [tag])
    
    service.save(question, PostType.ASKED)   
    
    assertNotNull Question.get(1)
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.ASKED
  }

  void testQuestionCreateFail() {		

    /* Fail because no content are defined. */
    def question = new Question(title: "a", tags: [tag])

    shouldFail(PostException) {
      service.save(question, PostType.ASKED)   
    }
  }

  void testQuestionUpdateOk() {
    
    q.content = "Toto"

    service.update(q)

    assertEquals "Toto", Question.get(1).content
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.REVISION
  }

  void testQuestionUpdateFail() {

    /* Fail because no content are defined. */
    q.tags = []
    
    shouldFail(PostException) {
      service.update(q)   
    }
  }

  void testQuestionDelete() {
    
    service.delete(q)

    assertNull Question.get(1)
  } 

  void testQuestionAccepted() {
    
    service.accepted(q)
    
    assertEquals q.isAccepted, true
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.ACCEPTED
  }

  void testQuestionIncMark() {
   
    assertEquals q.mark, 0
    service.incMark(q)
    assertEquals q.mark, 1
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.VOTE_UP
  }

  void testQuestionDownMark() {
    
    assertEquals q.mark, 0
    service.downMark(q)
    assertEquals q.mark, -1
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.VOTE_DOWN
  }

  /*--------------------------------------------*/
  /*                 Answer                     */
  /*--------------------------------------------*/
  void testAnswerCreateOk() {			
    
    def answer = new Answer(content: "a", question: q)
    
    service.save(answer, PostType.ANSWERED)   
    
    assertNotNull Answer.get(1)
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.ANSWERED
  }

  void testAnswerCreateFail() {		

    /* Fail because no content are defined. */
    def answer = new Answer(question: q)

    shouldFail(PostException) {
      service.save(answer, PostType.ANSWERED)   
    }
  }
  
  void testAnswerUpdateOk() {
    
    a.content = "Toto"

    service.update(a)

    assertEquals "Toto", Answer.get(1).content
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.REVISION
  }

  void testAnswerUpdateFail() {

    /* Fail because no content are defined. */
    a.content = "" 
    shouldFail(PostException) {
      service.update(a)   
    }
  }

  void testAnswerDelete() {
    
    service.delete(a)

    assertNull Answer.get(1)
  }

  void testAnswerAccepted() {
    
    service.accepted(a)
    
    assertEquals a.isAccepted, true
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.ACCEPTED
  }

  void testAnswerIncMark() {
   
    assertEquals a.mark, 0
    service.incMark(a)
    assertEquals a.mark, 1
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.VOTE_UP
  }

  void testAnswerDownMark() {
    
    assertEquals a.mark, 0
    service.downMark(a)
    assertEquals a.mark, -1
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.VOTE_DOWN
  }


  /*--------------------------------------------*/
  /*                 Comment                    */
  /*--------------------------------------------*/
  void testCommentCreateOk() {			
    
    def comment = new Comment(content: "a", post: q)
    
    service.save(comment, PostType.COMMENTED)   
    
    assertNotNull Comment.get(1)
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.COMMENTED
  }

  void testCommentCreateFail() {		

    /* Fail because no content are defined. */
    def comment = new Comment(post: q)

    shouldFail(PostException) {
      service.save(comment, PostType.COMMENTED)   
    }
  }
  
  void testCommentUpdateOk() {
    
    c.content = "Toto"

    service.update(c)

    assertEquals "Toto", Comment.get(1).content
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.REVISION
  }

  void testCommentUpdateFail() {

    /* Fail because no content are defined. */
    c.content = "" 
    shouldFail(PostException) {
      service.update(c)   
    }
  }

  void testCommentDelete() {
    
    service.delete(c)

    assertNull Comment.get(1)
  }

  void testCommentAccepted() {
    
    service.accepted(c)
    
    assertEquals Comment.get(1).isAccepted, true
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.ACCEPTED
  }

  void testCommentIncMark() {
   
    assertEquals c.mark, 0
    service.incMark(c)
    assertEquals c.mark, 1
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.VOTE_UP
  }

  void testCommentDownMark() {
    
    assertEquals c.mark, 0
    service.downMark(c)
    assertEquals c.mark, -1
    
    def history = PostHistory.get(1)

    assertNotNull history
    assertEquals history.type, PostType.VOTE_DOWN
  }

  
  /* Global */
  void testDeleteNullPost() {
    
    shouldFail(PostException) {
      service.delete(null)   
    }
  }
}
