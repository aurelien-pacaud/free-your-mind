package fr.isima

import fr.isima.exception.PostException

class AnswerService {

  def postHistoryService
  def awardService
  
  /**
   * Service method to save a answer.
   *
   * @param a Answer to save in DB.
   */
  def save(Answer a) {

    /* If the answer can't be saved in DB. */
    if (!a.validate()) {		
      
      a.errors.allErrors.each {
        println it
      }
      throw new PostException("Answer can't be saved");
    }
    else {

      def id = a.id
    
      a.save();

      if (id == null)
        /* Add new entry in postHistory table. */ 
        postHistoryService.createAnsweredHistory(a, a.contributor)
      else
        /* Add new entry in postHistory table. */ 
        postHistoryService.createRevisionHistory(a, a.contributor)
	  
	  awardService.checkAward(question.contributor)
    }
  }
}
