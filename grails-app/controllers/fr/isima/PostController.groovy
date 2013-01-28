package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class PostController {

	//static scaffold = true
	
	def display = {
		
		[post: Question.getAll()]
	}
}