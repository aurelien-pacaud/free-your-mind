package fr.isima

import org.springframework.dao.DataIntegrityViolationException

import com.sun.org.apache.xalan.internal.xsltc.compiler.ForEach;

import grails.plugins.springsecurity.Secured


class ContributorController {

	static scaffold = false   
	
	// Contributors' service
   def contributorService
	
	/**
	 * Display the user which id is specified 
	 */
    @Secured(['IS_AUTHENTICATED_FULLY'])
    def show = {
		Contributor c = Contributor.get(params.get("id"))
		contributorService.incrViewCounter(c);
		def List<Answer> answers = new ArrayList<Answer>()
		for(PostHistory p : c.postHistories) {
			if (p.post instanceof Answer) {
				print "Answer"
				answers.add(p.post)
			}
			print "Question"
		}
		[user: c, answers:answers]
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
		def String login = params.get("login")
		def String password = params.get("password")
		def String confirmPassword = params.get("confirmPassword")
		def String email = params.get("email")		
		
		def Contributor c = new Contributor(firstName: "", lastName: "", username: login, password: password, 
						email: email, location: "", birthDate: "",isAdmin: false, 
						nbProfileViews: 0, registrationDate: new Date());
		
		if (!confirmPassword.equals(password)) {
			c.errors.rejectValue('password','user.password.doesnotmatch')
		} 
							
		// Insert the contributor in the DB
		if (!contributorService.create(c)) {
			
			render(view: "create", model:[user: c, confirmPassword: confirmPassword])
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