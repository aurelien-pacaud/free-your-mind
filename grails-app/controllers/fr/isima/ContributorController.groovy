package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class ContributorController {

	static scaffold = false   
	
	/**
	 * Display the user which id is specified 
	 */
	def show = {
		[user: Contributor.get(params.get("id"))]
	}
	
	/**
	 * Display the user creation form
	 */
	def create = {
		
	}
	
	/**
	 * Create a new user from the form
	 */
	def createUser = {
		
		def String firstName = params.get("firstName")
		def String lastName = params.get("lastName")
		def String login = params.get("login")
		def String password = params.get("password")
		def String email = params.get("email")
		def String location = params.get("location")
		def Date birthDate = params.get("birthDate")
		
		def Contributor c = new Contributor(firstName: firstName, lastName: lastName, login: login, password: password, 
						email: email, location: location, birthDate: birthDate,isAdmin: false, 
						nbProfileViews: 0, registrationDate: new Date());
		
		
		if (!c.validate()) {
			render(view: "create", model:[user: c])
		} else {
			c.save();
			redirect(action: "list");
		}
	}
	
	/**
	 * List all users
	 */
	def list = {
		
		[users: Contributor.findAll()]
	}
	
}