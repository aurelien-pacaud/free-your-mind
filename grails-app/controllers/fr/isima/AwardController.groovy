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
		[awards:Award.findAll([sort:"title"])]
	}
	
	def create = {
		[tags: Tag.json()]
	}
	
	def edit = {
		def award = Award.get(params.id)		
		render(view: "create", model:[award:award])
	}
	
	
	/**
	 * Create a new award from the form
	 */
	def createAward = {
  
	  // Get all attributes form the form
	    def title = params.title
		def description = params.description
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
  
		if (type != AwardType.REPUTATION) {
			print "REPUT"
			switch (type) {
				case "NB_QUESTIONS":
					type = AwardType.NB_QUESTIONS
					description = "Posted " + bound + " questions for the " + tags.get(0).name + " tag"
					break;
				case "NB_ANSWERS":
					type = AwardType.NB_ANSWERS
					description = "Posted " + bound + " answers for the " + tags.get(0).name + " tag"
					break;
				case "NB_COMMENTS":
					type = AwardType.NB_COMMENTS
					description = "Posted " + bound + " comments for the " + tags.get(0).name + " tag"
					break;
			}
			
		}
		def Award a = new Award(title: title, description: description, bound: bound, 
								tag: tags.get(0), category: category, type: type);
  
	  // Insert the contributor in the DB
	  try {
		  if (!awardService.create(a)) {
			render(view: "create", model:[award: a])
		  } else {
			redirect(controller: "award", action: "list")
		  }
	  } catch(e) {
	  	render view: "create", model: [award: a, tags: Tag.json()]
	  }
	}
}
