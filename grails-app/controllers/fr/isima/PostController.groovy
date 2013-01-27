package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class PostController {

	//static scaffold = true
	
	def display = {
		
		[post: Post.findAll("from Post as p where p.title != NULL order by p.creationDate")]
	}
}