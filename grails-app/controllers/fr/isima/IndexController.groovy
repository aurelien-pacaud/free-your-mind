package fr.isima

class IndexController {

    def index = { 
		
		def questions = Question.getAll()
		[questions: questions, tags: Tag.findAll("from Tag as t order by char_length(t.name)"), questionNb : questions.size(), locality: "index"]
	}
}
