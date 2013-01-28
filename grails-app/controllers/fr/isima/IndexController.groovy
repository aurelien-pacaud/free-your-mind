package fr.isima

class IndexController {

    def index = { 
		
		[questions: Question.getAll()]
	}
}
