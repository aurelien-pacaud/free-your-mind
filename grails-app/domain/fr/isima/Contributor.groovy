package fr.isima

class Contributor {

	String login
	String password
	
	String firstName
	String lastName	
	Date birthDate
	String location
	
	Date registrationDate
	long nbProfileViews = 0
	Date lastConnectionDate
	boolean isAdmin = false
	long reputation = 0
	
    static constraints = {
		login(nullable:false, blank:false, minSize:3, unique:true)
		password(nullable:false, blank:false, minSize:6, maxSize:15)
		birthDate(nullable:false, blank:false)
    }
}