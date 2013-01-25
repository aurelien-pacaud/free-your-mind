package fr.isima

abstract class Post {

	String content
	Date lastEditionDate
	Date creationDate
	long mark = 0
	boolean isAccepted
	
	static hasMany = [tags:Tag]
	
    static constraints = {
		
    }
}