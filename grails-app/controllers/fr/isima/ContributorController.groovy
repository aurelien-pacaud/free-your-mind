package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class ContributorController {

	static scaffold = false   
	
	// Contributors' service
   def contributorService
	
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
		
		// Get all attributes form the form
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
		
		// Insert the contributor in the DB
		if (contributorService.create(c)) {
			render(view: "create", model:[user: c])
		} else {
			redirect(controller: "contributor", action: "list");
		}
		
	}
	
	/**
	 * List all users
	 */
	def list = {
		
		[users: Contributor.findAll()]
	}
	
}