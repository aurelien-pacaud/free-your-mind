package fr.isima

class PostHistoryService {

  def awardService
  
  def createPostHistory(Post post, Contributor user, PostType type) {
    
    def postHistory = new PostHistory(contributor: user, post: post, type: type)

    postHistory.save()

    //user.reputation += post.reputationWin
    /* Check award. */
    //awardService.checkAward(question.contributor)
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
    
    //user.reputation += post.reputationWin
    /* Check award. */
    //awardService.checkAward(question.contributor)
  }
}
