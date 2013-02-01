package fr.isima

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException


class QuestionController {
	
	def display = {
		
		[questions: Question.get(params.get("id"))]
	}
	
	def create = {
		
		HashMap jsonMap = new HashMap()
		def tagsList = Tag.getAll()
		
		jsonMap.tags = tagsList.collect{tag ->
					   		return [id: tag.id, name: tag.name]
					   }
						
		render(view: 'new', model: [tags: jsonMap as JSON])
	}
	
	def add = {
		
		def title = params.get("title")
		def content = params.get("content")
		def tagsId = params.get("tagsId")	
		
		def tags = []
		
		tagsId.split(";").each { id ->
			
			tags.add(Tag.get(id))
		}	
		
		def question = new Question(title: title, content: content, tags: tags, contributor:Contributor.get(1));
		
		question.save();
		redirect(action: "index", controller: "index");
	}
}