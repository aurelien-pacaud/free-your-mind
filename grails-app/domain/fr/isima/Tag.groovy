package fr.isima

class Tag {

	String name
	
	static belongsTo = Question
	static hasMany = [questions: Question]
	
    static constraints = {
		name(unique:true, blank:false, nullable:false)
    }
}
