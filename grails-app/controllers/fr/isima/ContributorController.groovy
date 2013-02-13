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
		def List<Answer> answers = new ArrayList<Answer>()
		def List<Question> questions = new ArrayList<Question>()
		def List<Comment> comments = new ArrayList<Comment>()
		def List<Tag> tags = new ArrayList<Tag>()
		def List<Award> awards = new ArrayList<Award>()
		
		// Incrementtion of the view's counter
		contributorService.incrViewCounter(c);
		
		// Get the list of answers in the user's postHistory
		for(PostHistory p : c.postHistories) {
			if (p.type != null && p.type.equals(PostType.ANSWERED)) {
				answers.add(p.post)
			} else if (p.type != null &&  p.type.equals(PostType.ASKED)) {
				questions.add(p.post)
				tags.addAll(p.post.tags)
			} else if (p.type != null &&  p.type.equals(PostType.COMMENTED)) {
				comments.add(p.post)
			}
		}
		
		[user: c, answers: answers, questions: questions, comments: comments, tags: tags, awards: awards]
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