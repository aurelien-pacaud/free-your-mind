package fr.isima

import java.util.Set;

import fr.isima.connection.Role;
import fr.isima.connection.UserRole;

class Contributor{

	transient springSecurityService
	
	// Information requiered for the connection
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	//  Contributor information
	String firstName
	String lastName	
	Date birthDate
	String location
	String email;
	
	Date registrationDate
	long nbProfileViews = 0
	Date lastConnectionDate
	boolean isAdmin = false
	long reputation = 0
	
	static hasMany = [posts: Post, comments: Comment, postHistories: PostHistory]
	
	static constraints = {
		username blank: false, unique: true
		password blank: false
		birthDate(nullable:true, blank:false)
		lastConnectionDate(nullable:true)
	}
	
	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

	
}
