package fr.isima

abstract class Post {

	String content
	Date lastEditionDate
	Date creationDate
	long mark = 0
	boolean isAccepted = false
	
	static hasMany = [tags:Tag]
	
    static constraints = {
		content(nullable:false, blank:false)
    }
}