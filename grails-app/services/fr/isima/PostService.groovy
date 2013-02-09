package fr.isima

import fr.isima.exception.PostException

class PostService {

	def postHistoryService
	
    /**
	 * Method use to save a post in the DB.
	 * 
	 * @param post Post to save.
	 */
    def create(Post post) {
		
		/* If the question can't be saved. */
		if (!post.validate())
			throw new PostException("Post can't be saved");
		else {
			
			post.save();
			/* Add new entry in History. */
			def postHistory = new PostHistory(contributor: post.contributor, post: post, 
											  date: new Date(), type: PostType.ASKED)
			
			postHistory.save()
		}			 
    }
	
	/**
	 * Method use to update a post in the DB.
	 *
	 * @param post Post to update.
	 */
	def update(Post post) {
		
		/* If the question can't be saved. */
		if (!post.save())
			throw new PostException("Post can't be updated");
		else {
			
			/* Add new entry in History. */
			def postHistory = new PostHistory(contributor: post.contributor, post: post,
											  date: new Date(), type: PostType.REVISION)
			
			postHistory.save()
		}
	}
	
	/**
	 * Method use to inc the mark of the post.
	 *
	 * @param post Post to update.
	 */
	def incMark(Post post) {
		
		post.mark++;
		postHistoryService.createVotedHistory(post, post.contributor)
		
		post.save();
	}
	
	/**
	 * Method use to down the mark of the post.
	 *
	 * @param post Post to update.
	 */
	def downMark(Post post) {
		
		post.mark--;
		postHistoryService.createVotedHistory(post, post.contributor)
		
		post.save();
	}

        def accepted(Post post) {
        
          post.isAccepted = true;
          post.save()
        }
}
