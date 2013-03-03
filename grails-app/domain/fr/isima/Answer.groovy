package fr.isima

class Answer extends Post{
	
	static belongsTo = [question:Question, contributor: Contributor]
    static constraints = {
    }
}
