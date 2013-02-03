package fr.isima

import com.google.protobuf.ServiceException

class QuestionService {

	/**
	 * Method use to update the number of view of a question.
	 *
	 * @param question Question to update.
	 */
	def incViewCpt(Question question) {
		
		question.nbView++;
	}
}
