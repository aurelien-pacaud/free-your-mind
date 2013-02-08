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
	
	def createVotedHistory(Post post, Contributor user) {
	
		def postHistory = new PostHistory(contributor: user, post: post,
			date: new Date(), type: PostType.VOTED)

		postHistory.save()
	}
}
