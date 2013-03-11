package fr.isima

import grails.test.GrailsUnitTestCase

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(AwardService)
@Mock([Award, Contributor, Tag, AwardHistory, Question, Comment, Answer, PostHistory])
class AwardServiceTests {
    
    def awardReputation
    def awardQuestionTag
    def awardQuestion
    def awardAnswerTag
    def awardAnswer
    def awardCommentTag
    def awardComment
    def user

    void setUp() {
    
      defineBeans {

        awardHistoryService(AwardHistoryService){ bean ->
          bean.autowire = true
        }
        postHistoryService(PostHistoryService){ bean ->
          bean.autowire = true
        }
      }
      
      Contributor.metaClass.encodePassword = { -> }

      user = new Contributor(username: "Toto", password: "fffffff", email: "", location: "", birthDate: new Date(), isAdmin: true, enabled: true, reputation:1)
      user.save(flush: true)
      
      def tag = new Tag(name: "C++", description: "C++ is a widely-used, statically-typed, free-form, compiled, multi-paradigm, multi-level") 

      awardReputation = new Award(title: "N00b", bound: 1, type: AwardType.REPUTATION, category: AwardCategory.BRONZE)
      awardReputation.save()
     
      awardQuestionTag = new Award(title: "C++ Beginner", bound: 1, type: AwardType.NB_QUESTIONS, category: AwardCategory.SILVER, tag: tag)
      awardQuestionTag.save()
     
      awardQuestion = new Award(title: "Beginner", bound: 1, type: AwardType.NB_QUESTIONS, category: AwardCategory.SILVER)
      awardQuestion.save()
      
      awardAnswerTag = new Award(title: "C++ Helper", bound: 1, type: AwardType.NB_ANSWERS, category: AwardCategory.SILVER, tag: tag)
      awardAnswerTag.save()
      
      awardAnswer = new Award(title: "Helper", bound: 1, type: AwardType.NB_ANSWERS, category: AwardCategory.SILVER)
      awardAnswer.save()

      awardCommentTag = new Award(title: "C++ Commentator", bound: 1, type: AwardType.NB_COMMENTS, category: AwardCategory.SILVER, tag: tag)
      awardCommentTag.save()
      
      awardComment = new Award(title: "Commentator", bound: 1, type: AwardType.NB_COMMENTS, category: AwardCategory.SILVER)
      awardComment.save()

      def q = new Question(title: "a", content: "a", tags: [tag], contributor: user, editionContributor: user)
      q.save(flush: true)

      def a = new Answer(content: "a", question: q, contributor: user, editionContributor: user)
      a.save(flush: true)
    
      def c = new Comment(content: "a", post: q, contributor: user, editionContributor: user)
      c.save(flush: true)
    }

    void testCheckAward() {
      
      service.checkAward(user)

      assertEquals AwardHistory.get(1).award.type, AwardType.REPUTATION
      assertEquals AwardHistory.get(1).award.title, "N00b"
      
      assertEquals AwardHistory.get(2).award.type, AwardType.NB_QUESTIONS
      assertEquals AwardHistory.get(2).award.title, "C++ Beginner"
      
      assertEquals AwardHistory.get(3).award.type, AwardType.NB_QUESTIONS
      assertEquals AwardHistory.get(3).award.title, "Beginner"

      assertEquals AwardHistory.get(4).award.type, AwardType.NB_ANSWERS
      assertEquals AwardHistory.get(4).award.title, "C++ Helper"
      
      assertEquals AwardHistory.get(5).award.type, AwardType.NB_ANSWERS
      assertEquals AwardHistory.get(5).award.title, "Helper"

      assertEquals AwardHistory.get(6).award.type, AwardType.NB_COMMENTS
      assertEquals AwardHistory.get(6).award.title, "C++ Commentator"
      
      assertEquals AwardHistory.get(7).award.type, AwardType.NB_COMMENTS
      assertEquals AwardHistory.get(7).award.title, "Commentator"

      assertEquals 7, AwardHistory.count() 
    }
}
