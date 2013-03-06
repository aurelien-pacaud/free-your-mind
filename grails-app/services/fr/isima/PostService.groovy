package fr.isima

import fr.isima.exception.PostException

class PostService {

  def springSecurityService
  def postHistoryService

  /**
   * Method use to save a post in the DB.
   * 
   * @param post Post to save.
   */
  def save(Post post, PostType type) {

    log.info "Save post " + post.class

    /* If the question can't be saved. */
    if (!post.validate())
      throw new PostException("Post can't be saved");
    else {

      post.save();

      /* Add new entry in History. */
      def postHistory = new PostHistory(contributor: post.contributor, post: post, type: type)

      postHistory.save()
    }			 
  }

  /**
   * Method use to update a post in the DB.
   *
   * @param post Post to update.
   */
  def update(Post post) {

    /* If the post can't be saved. */
    if (!post.validate())
      throw new PostException("Post can't be updated");
    else {

      post.save();

      /* Add new entry revision in History. */
      def postHistory = new PostHistory(contributor: post.contributor, post: post, type: PostType.REVISION)

      postHistory.save()
    }
  }

  /**
   * Method use to inc the mark of the post.
   *
   * @param post Post to update.
   */
  def incMark(Post post) {

    def user = springSecurityService.getCurrentUser()

    post.mark++;
    postHistoryService.createVotedUpHistory(post, user)

    post.save();
  }

  /**
   * Method use to down the mark of the post.
   *
   * @param post Post to update.
   */
  def downMark(Post post) {

    def user = springSecurityService.getCurrentUser()

    post.mark--;
    postHistoryService.createVotedDownHistory(post, user)

    post.save();
  }

  def accepted(Post post) {

    post.isAccepted = true;
    post.save()
  }

  def delete(Post post) {

    post.delete()
  }
}
