package fr.isima

import com.google.protobuf.ServiceException

class QuestionService {
	
	def create(Question question) {
		
		/* If the question can't be saved. */
		if (!question.validate())
			throw new ServiceException("Post can't be saved");
		else {
			
			question.save();
			/* Add new entry in History. */
			def postHistory = new PostHistory(contributor: question.contributor, post: question,
											  date: new Date(), type: PostType.ASKED)
			
			postHistory.save()
		}
	}
	
	/**
	 * Method use to update the number of view of a question.
	 *
	 * @param question Question to update.
	 */
	def incViewCpt(Question question) {
		
		question.nbView++;
	}
}
