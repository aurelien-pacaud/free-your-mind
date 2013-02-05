package fr.isima

import org.springframework.dao.DataIntegrityViolationException


class QuestionController {
	
	def postService
	def questionService
	
	def display = {
		
		def question = Question.get(params.get("id"))
		
		questionService.incViewCpt(question)		
		[question: question]
	}
	
	def create = {
						
		render view: 'new', model: [tags: Tag.json(), locality: "ask"]
	}
	
	def add = {
		
		def title = params.title
		def content = params.content
		def tagsId = params.tagsId	
		def tagIds = []
		def tags = []
		
		tagsId.split(";").each { id ->
			
			tags.add(Tag.get(id))
			tagIds.add(id);
		}
		
		log.info tags
		
		def question = new Question(title: title, content: content, tags: tags, contributor:Contributor.get(1));
				
		try {
			questionService.create(question)			
			redirect action: "display", id: question.id
		}
		catch (e) {
			render view: 'new', model: [question: question, tags: Tag.json(), tagIds: tagIds]
		}
	}
}