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
      
      /* Check award. */
      awardService.checkAward(post.contributor)
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
  
      /* Check award. */
      awardService.checkAward(post.contributor)
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
    
    post.contributor.reputation += post.reputationVoteUp
    /* Check award. */
    awardService.checkAward(post.contributor)
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
    
    post.contributor.reputation += post.reputationVoteDown
    user.reputation             += post.reputationVoter
    
    /* Check award. */
    awardService.checkAward(post.contributor)
    awardService.checkAward(user)
  }

  def accepted(Post post) {

    def user = springSecurityService.getCurrentUser()
    
    post.isAccepted = true;
    post.save()
    
    postHistoryService.createAcceptedHistory(post, post.contributor)
    
    post.contributor.reputation += post.reputationAccepted
    user.reputation             += post.reputationAcceptor
    
    /* Check award. */
    awardService.checkAward(post.contributor)
    awardService.checkAward(user)
  }
}
