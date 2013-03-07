package fr.isima

import fr.isima.exception.TagException

class TagService {

  /**
   *  Method used to persist a tag in DB
   * 
   *  @param tag Tag to persist
   */
  def save(Tag tag) {
    
    if (!tag.validate()) {
      
      log.error "Tag creation error"
      throw new TagException("Tag can't be saved")
    }
    else {
      
      tag.save()
    }
  }

  /**
   *  Method used to update a tag in DB
   * 
   *  @param tag Tag to be updated
   */

  def update(Tag tag) {
    
    if (!tag.validate()) {
      
      log.error "Tag edition error"
      throw new TagException("Tag can't be edited")
    }
    else {
      
      tag.save()
    }
  }

  /**
   *  Method used to delete a tag in DB
   *
   *  @param tag Tag to delete
   */
  def delete(Tag tag) {
    
    if(tag != null && tag.questions.isEmpty()) {
    
      tag.delete()
    }
    else {
      
      log.error "Tag deletion error"
      throw new TagException("Tag can't be deleted")
    }
  }
}
