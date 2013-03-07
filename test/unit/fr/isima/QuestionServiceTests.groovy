package fr.isima

@TestFor(QuestionService)
@Mock([Contributor, Question, Tag])
class QuestionServiceTests {

  def user
  def tag

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
  }

  void testIncView() {

    def question = new Question(title: "a", content: "a", tags: [tag], contributor: user, editionContributor: user)
    question.save(flush: true)
    
    assertEquals 0, question.nbView
    service.incViewCpt(question)
    assertEquals 1, question.nbView
  }

  void testIncViewWithNullQuestion() {

    service.incViewCpt(null)
  }

  void testLock() {
    
    def question = new Question(title: "a", content: "a", tags: [tag], contributor: user, editionContributor: user)
    question.save(flush: true)

    
    assertFalse question.isClosed
    service.lock(question)
    assertTrue question.isClosed
  }

  void testLockWithNullQuestion() {
    
    service.lock(null)
  }

  void testUnlock() {
    
    def question = new Question(title: "a", content: "a", tags: [tag], contributor: user, editionContributor: user, isClosed: true)
    question.save(flush: true)

    assertTrue question.isClosed
    service.unlock(question)
    assertFalse question.isClosed
  }

  void testUnlockWithNullQuestion() {
    
    service.unlock(null)
  }

}
