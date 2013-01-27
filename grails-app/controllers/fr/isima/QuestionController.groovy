package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class QuestionController {

	static scaffold = true
	
	def display = {
		//def commentHistory = CommentHistory.findAll("from commentHistory c where c.post.id = " + params.get("id"))
		
		[questions: Question.get(params.get("id"))]
	}
}