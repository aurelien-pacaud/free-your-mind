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
		def answers = [] 
		def questions = []
		def comments = []
		def tagsCounter = [:]
		def tags = []
		def awards = []
		
		// Incrementtion of the view's counter
		contributorService.incrViewCounter(c);
		
		// Get the list of answers in the user's postHistory
		for (PostHistory p : c.postHistories) {
			if (p.type != null && p.type.equals(PostType.ANSWERED)) {
				answers.add(p.post)
			} else if (p.type != null &&  p.type.equals(PostType.ASKED)) {
				questions.add(p.post)
				for (Tag t : ((Question)p.post).tags) {
					if (tagsCounter.containsKey(t.name)) {
						tagsCounter.put(t.name, tagsCounter.get(t.name) + 1)
					} else {
						tagsCounter.put(t.name, 1)
						tags.add(t)
					} 
				}
			} else if (p.type != null &&  p.type.equals(PostType.COMMENTED)) {
				comments.add(p.post)
			}
		}
		
		[user: c, answers: answers, questions: questions, comments: comments, tags: tags, tagsCounter: tagsCounter, awards: awards]
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
		
		// Insert the contributor in the DB
		if (!contributorService.create(c,confirmPassword)) {
			render(view: "create", model:[user: c, confirmPassword: confirmPassword])
		} else {
			redirect(controller: "contributor", action: "list")
		}
		
	}
	
	/**
	 * List all users
	 */
	def list = {
		
		[users: Contributor.findAll()]
	}
	
	/**
	 * Edit the  user profile
	 */ 
	 def edit = {
		 def id = params.get("id")
		 def user = Contributor.get(id)
		 [user: user]
	 }
	 
	 /**
	  * Create a new user from the form
	  */
	 def updateUser = {
		 
		 // Get all attributes form the form
		 def id = params.get("id")
		 def password = params.get("password")
		 def email = params.get("email")
		 def firstName = params.get("firstName")
		 def lastName = params.get("lastName")
		 def location = params.get("location")
		 def birthDate = params.get("birthDate")
		 def avatar = params.get("avatar")
		 
		 def Contributor c = Contributor.get(id)
		 
		 if (c != null) {
			 c.setPassword(password)
			 c.setEmail(email)
			 c.setFirstName(firstName)
			 c.setLastName(lastName)
			 c.setLocation(location)
			 c.setBirthDate(birthDate)	
			 c.setAvatar(avatar)		 
		 }
		
							 
		 // Insert the contributor in the DB
		 if (!contributorService.update(c)) {	
			 render(view: "edit", model:[user: c])
		 } else {
			 redirect(controller: "contributor", action: "list")
		 }
		 
	 }
	 
	 /**
	  * Display the avatar selector view
	  */
	 def edit_avatar = {
		 def id = params.get("id")
		 
		 def user = Contributor.get(id)
		 if (user != null ) {
			 render(view: "edit_avatar", model:[user: user])
		 }
	 }
	 
	 /**
	  * Save the image in the user table
	  */
	 def upload_avatar = {
		 def id = params.get("id")
		 
		 def user = Contributor.get(id)
		 if (user != null ) {
			 // Get the avatar file from the multi-part request
			 def f = request.getFile('avatar')
		   
			 if (f != null) {
				 // List of OK mime-types
				 def okcontents = ['image/png', 'image/jpeg', 'image/gif']
				 if (! okcontents.contains(f.getContentType())) {
				   flash.message = "Avatar must be one of: ${okcontents}"
				   render(view:'edit', model:[user:user])
				   return;
				 }
			   
				 // Save the image and mime type
				 user.avatar = f.getBytes()
				 user.avatarType = f.getContentType()
				 log.info("File uploaded: " + user.avatarType)
				 // Validation works, will check if the image is too big
				 if (!user.save()) {
				   render(view:'edit', model:[user:user])
				   return;
				 }
				 print "Avatar (${user.avatarType}, ${user.avatar.size()} bytes) uploaded."
				 redirect(action:'show', id: user.id)
			 }
		 }
	   }
		 
		 
	 /**
	  * Display the avatar image
	  */
	 def avatar_image = {
		 def avatarUser = Contributor.get(params.id)
		 if (!avatarUser || !avatarUser.avatar || !avatarUser.avatarType ) {
		   response.sendError(404)
		   return;
		 }
		 response.setContentType(avatarUser.avatarType)
		 response.setContentLength(avatarUser.avatar.size())
		 OutputStream out = response.getOutputStream();
		 out.write(avatarUser.avatar);
		 out.close();
	  }
	 
	
}