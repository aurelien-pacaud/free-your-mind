package fr.isima

import fr.isima.exception.PostException

class CommentService {
  
  def postHistoryService
  def awardService
  
  /**
   * Service method to save a comment.
   *
   * @param comment Comment to save in DB.
   */
  def save(Comment comment) {

    /* If the answer can't be saved in DB. */
    if (!comment.validate()) {		

      comment.errors.allErrors.each {
        println it
      }
      throw new PostException("Comment can't be saved");
    }
    else {

      def id = comment.id

      comment.save();

      if (id == null)
        /* Add new entry in postHistory table. */ 
        postHistoryService.createCommentedHistory(comment, comment.contributor)
      else
        /* Add new entry in postHistory table. */ 
        postHistoryService.createRevisionHistory(comment, comment.contributor)
		
	  awardService.checkAward(question.contributor)
    }
  }
}
