package fr.isima

import fr.isima.exception.TagException
import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class TagController {

  def tagService

  def show(Long id) {

    def tag = Tag.get(id)
    
    if (!tag) {

      flash.message = "Tag not found!"
      redirect action: "list"
      return
    }

    render view: "show", model: [tag: Tag.get(params.id)]
  }

  def list = {

    render view: "list", model: [tags: Tag.getAll()]
  }

  @Secured(['IS_AUTHENTICATED_FULLY'])
  def edit = {
    [tag: Tag.get(params.id)]
  }
  
  def update = {
    
    def tag = Tag.get(params.id)
    
    tag.description = params.description

    try {
      
      /* Try to update the tag. */
      tagService.update(tag)
      
      flash.message = "Tag edited with success!"
      redirect action: "show", id: tag.id 
    }
    catch (e) {
      render view: "edit", model: [tag: tag]
    }
  }  
  
  @Secured(['IS_AUTHENTICATED_FULLY'])
  def create = {
    [tag: new Tag(params)]
  }

  def save = {

    def tag = new Tag(params)
    
    try {
      
      /* Try to save the new tag. */
      tagService.save(tag)
      
      flash.message = "Tag added with success!"
      redirect action: "show", id: tag.id 
    }
    catch (e) {
      render view: "create", model: [tag: tag] 
    }
  }
  
  def delete = {

    def tag = Tag.get(params.id)

    try {
      
      /* Try to delete the tag. */
      tagService.delete(tag)
      
      flash.message = "Tag deleted with success!"
      redirect action: "list"
    }
    catch (e) {
      render view: "create", model: [tag: tag] 
    }
  }
}


