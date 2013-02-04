package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class AnswerController {

	def add = {
		
		println "Add"
		
		def contributor = Contributor.get(params.get("idC"))
		def question = Question.get(params.get("idQ"))
		
		def a = new Answer(content: params.get("answerdContent"), question: question, contributor: contributor)
		
		if (a.save()) {		
			render template: "/post/postTemplate", bean: a, var: "post"
		}
		else {
			a.errors.each {
				println it
			}
		}
	}
   
}