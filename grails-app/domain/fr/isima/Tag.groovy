package fr.isima

class Tag {

	String name
	String description
	
	static belongsTo = Question
	static hasMany = [questions: Question]
	
    static constraints = {
		name(unique:true, blank:false, nullable:false)
    }
}
