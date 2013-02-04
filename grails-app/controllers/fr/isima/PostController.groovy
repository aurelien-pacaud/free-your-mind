package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class PostController {

	//static scaffold = true
	
	def postService
	
	def display = {
		
		[post: Question.getAll()]
	}
	
	def incMark = {
		
		postService.incMark(Question.get(params.get("id")))
		//[question: Question.get(params.get("id"))]
		render Question.get(params.get("id")).mark
	}
	
	def downMark = {
		
		postService.downMark(Question.get(params.get("id")))
		//[question: Question.get(params.get("id"))]
		render Question.get(params.get("id")).mark
	}
}