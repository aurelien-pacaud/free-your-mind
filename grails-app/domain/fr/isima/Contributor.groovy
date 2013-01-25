package fr.isima

class Contributor {

	String firstName
	String lastName
	String login
	String password
	Date birthDate
	String location
	Date registrationDate
	long nbProfileViews
	Date lastConnectionDate
	boolean isAdmin
	long reputation
	
    static constraints = {
		login(nullable:false, minSize:3, unique:true)
		password(nullable:false, minSize:6, maxSize:15)
		birthDate(nullable:false)
    }
}