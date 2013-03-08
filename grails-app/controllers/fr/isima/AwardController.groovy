package fr.isima

import org.springframework.dao.DataIntegrityViolationException

import fr.isima.AwardType;

class AwardController {

	static scaffold = true
	def awardService
	
	def display = {
		Award a = Award.get(params.get("id"))
		[award:a]
	}
	
	def list = {
		[awards:Award.findAll([sort: "title"])]
	}
	
	def create = {
		[tags: Tag.json()]
	}
	
	def edit = {
		def award = Award.get(params.id)	
		def tagIds = []
		if(award.tag != null)
			tagIds.add(award.tag.id)
		render(view: "edit", model:[award:award, tags: Tag.json(), tagIds:tagIds])
	}
	
	
	/**
	 * Create a new award from the form
	 */
	def createAward = {
  
		// Get all attributes form the form
	    def title = params.title
		def description = ""
		def bound = params.bound
		def category = params.category
		def type = params.type
		
		def tagsId = params.tagsId
		def tagIds = []
		def tags = []
		def view = null
	   
		if (tagsId != "") {
		    tagsId.split(";").each { id ->
				tags.add(Tag.get(id))
				tagIds.add(id);
			}
		}
  
		
		def Award a
		// if multiple tags we create 1 award by tag
		if (tags.size() > 1) {
			tags.each {  
				// Description computed for awardType different from Reputation
				if (type != AwardType.REPUTATION && it.size() != 0) {
					switch (type) {
						case AwardType.NB_QUESTIONS.toString():
							description = "Posted " + bound + " questions "
							break;
						case AwardType.NB_ANSWERS.toString():
							description = "Posted " + bound + " answers "
							break;
						case AwardType.NB_COMMENTS.toString():
							description = "Posted " + bound + " comments "
							break;
					}
					description +=	"for the " + it.name + " tag"
					title += " " + it.name
				} else {
					description = "User has reach " + bound + " reputation points"
				}
				
				a = new Award(title: title, description: description, bound: bound,
										tag: it, category: category, type: type);
		  
				// Insert the contributor in the DB
				try {
					  if (!awardService.save(a)) {
						render(view: "create", model:[award: a])
					  } else {
						redirect(controller: "award", action: "list")
					  }
				} catch(e) {
					  render view: "create", model: [award: a, tags: Tag.json(), tagIds:it.id]
				}
			}
		} else {
			def tag = null;
			// Description computed for awardType different from Reputation
			if (type != AwardType.REPUTATION.toString()) {
				switch (type) {
					case AwardType.NB_QUESTIONS.toString():
						description = "Posted " + bound + " questions "
						break;
					case AwardType.NB_ANSWERS.toString():
						description = "Posted " + bound + " answers "
						break;
					case AwardType.NB_COMMENTS.toString():
						description = "Posted " + bound + " comments "
						break;
				}
				if ( tags.size() == 1) {
					description +=	"for the " + tags.get(0).name + " tag"
					title += " " + tags.get(0).name
					tag = tags.get(0)
				}
				
			} else {
				description = "User has reach " + bound + " reputation points"
			}

			a = new Award(title: title, description: description, bound: bound,
						  tag: tag, category: category, type: type);
	  
			// Insert the contributor in the DB
			try {
				  if (!awardService.save(a)) {
					render(view: "create", model:[award: a])
				  } else {
					redirect(controller: "award", action: "list")
				  }
			} catch(e) {
			  	render view: "create", model: [award: a, tags: Tag.json(),tagIds:tag?.id]
			}
		}
	}
	
	def updateAward = {
		// Get all attributes form the form
		def awardID =  params.awardId
		def title = params.title
		def description = ""
		def bound = params.bound
		def category = params.category
		def type = params.type
		
		def award  = Award.get(awardID)
		
		// Description computed 
		switch (type) {
			case AwardType.NB_QUESTIONS.toString():
				description = "Posted " + bound + " questions "
				break;
			case AwardType.NB_ANSWERS.toString():
				description = "Posted " + bound + " answers "
				break;
			case AwardType.NB_COMMENTS.toString():
				description = "Posted " + bound + " comments "
				break;
			case AwardType.REPUTATION.toString():
				description = "User has reach " + bound + " reputation points"
				break;
		}
		
		award.setTitle(title)
		award.setDescription(description)
		award.setBound(Integer.parseInt(bound))
		//award.setCategory(category)
		//award.setType(type)
		
		try {
			if (!awardService.save(a)) {
			  render(view: "edit", model:[award: a])
			} else {
			  redirect(controller: "award", action: "list")
			}
	    } catch(e) {
			render view: "edit", model: [award: a]
	    }
	}
}
