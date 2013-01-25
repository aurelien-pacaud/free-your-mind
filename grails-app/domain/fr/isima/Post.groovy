package fr.isima

abstract class Post {

	String content
	Date lastEditionDate
	Date creationDate
	long mark
	boolean isAccepted
	
	static hasMany = [tags:Tag]
	
    static constraints = {
		
    }
}