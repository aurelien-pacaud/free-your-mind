package fr.isima

class Answer extends Post{
	
	boolean isAccepted = false
	
	static belongsTo = [question:Question]
		
    static constraints = {
    }
}
