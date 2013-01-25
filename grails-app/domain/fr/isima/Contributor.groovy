package fr.isima

class Contributor {

	String firstName
	String lastName
	String login
	String password
	Date birthDate
	String location
	Date registrationDate
	long nbProfileViews = 0
	Date lastConnectionDate
	boolean isAdmin
	long reputation = 0
	
    static constraints = {
		login(nullable:false, blank:false, minSize:3, unique:true)
		password(nullable:false, blank:false, minSize:6, maxSize:15)
		birthDate(nullable:false)
    }
}