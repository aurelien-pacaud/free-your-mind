package fr.isima

class IndexController {

    def index = { 
		
		def questions = Question.getAll()
		[questions: questions, tags: Tag.getAll(), questionNb : questions.size()]
	}
}
