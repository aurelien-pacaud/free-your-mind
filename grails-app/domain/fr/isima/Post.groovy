package fr.isima

abstract class Post {

	String content
	Date lastEditionDate
	Date creationDate
	long mark = 0
	
	static belongsTo = [contributor:Contributor]
	static hasMany = [comments:Comment]
		
    static constraints = {
		content(nullable:false, blank:false)
    }
}