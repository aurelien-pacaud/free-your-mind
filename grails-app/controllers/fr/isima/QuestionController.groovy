package fr.isima

import org.springframework.dao.DataIntegrityViolationException


class QuestionController {
	
	def postService
	
	def display = {
		
		[questions: Question.get(params.get("id"))]
	}
	
	def create = {
						
		render view: 'new', model: [tags: Tag.json(), locality: "ask"]
	}
	
	def add = {
		
		def title = params.get("title")
		def content = params.get("content")
		def tagsId = params.get("tagsId")	
		def tagIds = []
		def tags = []
		
		tagsId.split(";").each { id ->
			
			tags.add(Tag.get(id))
			tagIds.add(id);
		}
		
		log.info tags
		
		def question = new Question(title: title, content: content, tags: tags, contributor:Contributor.get(1));
				
		try {
			postService.create(question)			
			redirect action: "display", id: question.id
		}
		catch (e) {
			render view: 'new', model: [question: question, tags: Tag.json(), tagIds: tagIds]
		}
	}
}