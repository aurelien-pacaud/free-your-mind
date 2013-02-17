package fr.isima

class PostHistoryService {

  def createAskedHistory(Post post, Contributor user) {

    def postHistory = new PostHistory(contributor: user, post: post,
    date: new Date(), type: PostType.ASKED)

    postHistory.save()
  }

  def createAnsweredHistory(Post post, Contributor user) {

    def postHistory = new PostHistory(contributor: user, post: post,
    date: new Date(), type: PostType.ANSWERED)

    postHistory.save()
  }

  def createVotedUpHistory(Post post, Contributor user) {

    def postHistory = new PostHistory(contributor: user, post: post,
    date: new Date(), type: PostType.VOTE_UP)

    postHistory.save()
  }
  
  def createVotedDownHistory(Post post, Contributor user) {

    def postHistory = new PostHistory(contributor: user, post: post,
    date: new Date(), type: PostType.VOTE_DOWN)

    postHistory.save()
  }
  
  def createCommentedHistory(Post post, Contributor user) {

    def postHistory = new PostHistory(contributor: user, post: post,
    date: new Date(), type: PostType.COMMENTED)

    postHistory.save()
  }

  
  def createRevisionHistory(Post post, Contributor user) {

    def postHistory = new PostHistory(contributor: user, post: post,
    date: new Date(), type: PostType.REVISION)

    postHistory.save()
  }
}
