package fr.isima

class Question extends Post{

	String title
	long nbView = 0
	boolean isClosed
		
	static hasMany = [tags:Tag, answers:Answer]
	
    static constraints = {
		title(blank:false, nullable:false)
    }
}