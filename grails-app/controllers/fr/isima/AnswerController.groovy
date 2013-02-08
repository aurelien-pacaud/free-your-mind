package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class AnswerController {

	def postHistoryService
	
	def add = {
		
		println "Add"
		
		def contributor = Contributor.get(params.get("idC"))
		def question = Question.get(params.get("idQ"))
		
		def a = new Answer(content: params.get("answerdContent"), question: question, contributor: getAuthenticatedUser())
		
		if (a.save()) {		
			
			postHistoryService.createAnsweredHistory(a, getAuthenticatedUser())
			render template: "/post/postTemplate", var: "post", collection: question.answers
		}
		else {
			a.errors.each {
				println it
			}
		}
	}
   
}