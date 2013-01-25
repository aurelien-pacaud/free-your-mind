package fr.isima

class Question  extends Post{

	String title
	boolean isClosed
	
	static hasMany = [answers:Answer]
	
    static constraints = {
    }
}