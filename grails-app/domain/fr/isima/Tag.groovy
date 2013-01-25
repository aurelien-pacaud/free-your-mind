package fr.isima

class Tag {

	String name
	
    static constraints = {
		name(unique:true, blank:false, nullable:false)
    }
}
