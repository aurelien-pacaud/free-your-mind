package fr.isima

abstract class Post {

	String content
	Date lastEditionDate
	Date creationDate
	long mark = 0
	boolean isAccepted = false
	
	static hasMany = [tags:Tag, comments:Comment]
	
    static constraints = {
		content(nullable:false, blank:false)
    }
}