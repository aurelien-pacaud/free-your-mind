package fr.isima

import fr.isima.exception.PostException

class PostService {

  def springSecurityService
  def postHistoryService
  def awardService

  /**
   * Method use to save a post in the DB.
   * 
   * @param post Post to save.
   */
  def save(Post post, PostType type) {
   
    def user = springSecurityService.getCurrentUser()

    post.contributor        = user
    post.editionContributor = user

    /* If the question can't be saved. */
    if (!post.validate())
      throw new PostException("Post can't be saved");
    else {

      post.save()

      /* Add new entry in History. */
      postHistoryService.createPostHistory(post, user, type)
    
      user.reputation += post.reputation
      /* Check award. */
      awardService.checkAward(question.contributor)
    }			 
  }

  /**
   * Method use to update a post in the DB.
   *
   * @param post Post to update.
   */
  def update(Post post) {
    
    def user = springSecurityService.getCurrentUser()

    post.lastEditionDate = new Date()
    post.editionContributor = user
    
    /* If the post can't be saved. */
    if (!post.validate())
      throw new PostException("Post can't be updated");
    else {

      post.save()

      /* Add new entry revision in History. */
      postHistoryService.createRevisionHistory(post, user)
    }
  }
  
  /**
   * Method use to delete a post in the DB.
   *
   * @param post Post to delete.
   */
  def delete(Post post) {
    
    if (post == null)
      throw new PostException("Post can't be deleted")
    else
      post.delete(flush: true)
  }

  /**
   * Method use to inc the mark of the post.
   *
   * @param post Post to update.
   */
  def incMark(Post post) {

    def user = springSecurityService.getCurrentUser()

    post.mark++;
    post.save();
    
    postHistoryService.createVotedUpHistory(post, user)
  }

  /**
   * Method use to down the mark of the post.
   *
   * @param post Post to update.
   */
  def downMark(Post post) {

    def user = springSecurityService.getCurrentUser()

    post.mark--;
    post.save();
    
    postHistoryService.createVotedDownHistory(post, user)
  }

  def accepted(Post post) {

    post.isAccepted = true;
    post.save()
    
    postHistoryService.createAcceptedHistory(post, post.contributor)
    
    post.contributor.reputation += 4
    springSecurityService.getCurrentUser().reputation += 2
    /* Check award. */
    awardService.checkAward(question.contributor)
  }
}
