package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class QuestionController {
	
	def display = {
		
		[questions: Question.get(params.get("id"))]
	}
	
	def create = {
						
		render view: 'new', model: [tags: Tag.json()]
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
		
		def question = new Question(title: title, content: content, tags: tags, contributor:Contributor.get(1));
		
		if (!question.save())
			render view: 'new', model: [question: question, tags: Tag.json(), tagIds: tagIds]
		else
			redirect action: "display", id: question.id
	}
}