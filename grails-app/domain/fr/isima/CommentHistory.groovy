package fr.isima

class CommentHistory {

	Date date
	
	static belongsTo = [contributor:Contributor, post:Post, comment:Comment] 
	
    static constraints = {
		
    }
}