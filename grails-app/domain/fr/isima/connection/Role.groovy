package fr.isima.connection

class Role {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
		
}

enum  RoleType {
	ROLE_ADMIN, ROLE_CONTRIBUTOR, ROLE_USER
}