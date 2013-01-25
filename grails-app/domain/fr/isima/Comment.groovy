package fr.isima

class Comment {

	String content
	Date lastEditionDate
	long mark = 0
	Date creationDate

    static constraints = {
		content(nullable:false)		
    }
}