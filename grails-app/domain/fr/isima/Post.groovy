package fr.isima

abstract class Post {

	String content
	Date lastEditionDate = new Date()
	Date creationDate = new Date()
	long mark = 0	
	boolean isAccepted = false
	
	static belongsTo = [contributor: Contributor]
	static hasMany = [comments: Comment, postHistories: PostHistory]
		
    static constraints = {
		content(nullable:false, blank:false)
    }
	
	static mapping = {
		content type: 'text'
	 }
}
