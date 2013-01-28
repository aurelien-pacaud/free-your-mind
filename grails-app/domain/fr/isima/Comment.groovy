package fr.isima

class Comment extends Post {

	String content
	Date lastEditionDate
	long mark = 0
	Date creationDate
	
	static belongsTo = [post:Post]
	
    static constraints = {
		content(nullable:false, blank:false)		
    }
}