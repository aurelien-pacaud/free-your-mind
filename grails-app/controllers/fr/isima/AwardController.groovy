package fr.isima

import org.springframework.dao.DataIntegrityViolationException

import fr.isima.AwardType;

class AwardController {

  def awardService

  def display = {
    Award a = Award.get(params.get("id"))
    [award:a]
  }

  def list(Integer max) {

    params.max = Math.min(max ?: 15, 30)
    [awards: Award.list(params), awardsCount: Award.count()]
  }

  def create = {
    [tags: Tag.json()]
  }

  def edit = {
    def award = Award.get(params.id)	
    def tagIds = []
    
    if (award.tag != null)
     tagIds.add(award.tag.id)
    
    render(view: "edit", model:[award:award, tags: Tag.json(), tagIds:tagIds])
  }


  /**
   * Create a new award from the form
   */
  def createAward = {

    // Get all attributes form the form
    def String title = params.title
    def String description = ""
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

    def int boundVal

    try {
      boundVal = Integer.parseInt(bound)
    } catch(e) {
      boundVal = 0
    }

    def Award a
    // if multiple tags we create 1 award by tag
    if (tags.size() > 1) {
      tags.each {  

        a = awardService.newAward(title, description, boundVal, (Tag) it,
            Enum.valueOf(AwardCategory.class, category) , Enum.valueOf(AwardType.class, type));

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
      def Tag tag = null;

      if(tags.size() > 0 )
        a = awardService.newAward(title, description, boundVal, tags.getAt(0),
            Enum.valueOf(AwardCategory.class, category) , Enum.valueOf(AwardType.class, type));
      else
        a = new Award(title: title, bound: bound, category: category, type: type);
      
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
    def bound = params.bound
    def category = params.category
    def type = params.type

    def award  = Award.get(awardID)

    award.setTitle(title)
    award.setBound(Integer.parseInt(bound))

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
