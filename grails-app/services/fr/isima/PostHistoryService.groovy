package fr.isima

class PostHistoryService {

  def createPostHistory(Post post, Contributor user, PostType type) {
    
    def postHistory = new PostHistory(contributor: user, post: post, type: type)

    postHistory.save()
  }

  def createVotedUpHistory(Post post, Contributor user) {

    def postHistory = new PostHistory(contributor: user, post: post, type: PostType.VOTE_UP)

    postHistory.save()
  }
  
  def createVotedDownHistory(Post post, Contributor user) {

    def postHistory = new PostHistory(contributor: user, post: post, type: PostType.VOTE_DOWN)

    postHistory.save()
  }
  
  def createRevisionHistory(Post post, Contributor user) {

    def postHistory = new PostHistory(contributor: user, post: post, type: PostType.REVISION)

    postHistory.save()
  }

  def createAcceptedHistory(Post post, Contributor user) {

    def postHistory = new PostHistory(contributor: user, post: post, type: PostType.ACCEPTED)

    postHistory.save()
  }

  def createReputationHistory(Contributor user, int reputation) {
   
    if (reputation != 0) {
      def postHistory = new PostHistory(contributor: user, post: null, type: PostType.REPUTATION, reputation: reputation)

      postHistory.save()
    }
  }
  
  def createAwardHistory(Contributor user, Award award) {
    
    def postHistory = new PostHistory(contributor: user, post: null, award: award, type: PostType.AWARD)

    postHistory.save()
  }
}
