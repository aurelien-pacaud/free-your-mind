package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class TagController {

	def show = {
		
		render view: "show", model: [tag: Tag.get(params.get("id")), locality: "tag"]
	}
	
	def list = {
		
		render view: "list", model: [tags: Tag.getAll(), locality: "tag"]
	}
}


