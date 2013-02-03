package fr.isima

import com.google.protobuf.ServiceException

class PostService {

    /**
	 * Method use to save a post in the DB.
	 * 
	 * @param post Post to save.
	 */
    def create(Post post) {
		
		/* If the question can't be saved. */
		if (!post.save())
			throw new ServiceException("Post can't be saved");
		else {
			
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
			throw new ServiceException("Post can't be updated");
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
		
		post.save();
	}
	
	/**
	 * Method use to down the mark of the post.
	 *
	 * @param post Post to update.
	 */
	def downMark(Post post) {
		
		post.mark--;
		
		post.save();
	}
}
