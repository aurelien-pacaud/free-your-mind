package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class PostController {

  def postService
  def postHistoryService

  /* 
   * Method used to increment the mark of a question.
   */
  def incMark = {

    def post = Post.get(params.id)

    postService.incMark(post)

    if (post.class.is(Comment))
      render template: '/comment/voteTemplate', var: 'post', bean: post
    else
      render template: '/post/voteTemplate', var: 'post', bean: post
  }

  /* 
   * Method used to decrement the mark of a question.
   */
  def downMark = {
    
    def post = Post.get(params.id)

    postService.downMark(post)

    /* If the user down vote the mark of comment. */
    if (post.class.is(Comment))
      render template: '/comment/voteTemplate', var: 'post', bean: post
    else
      render template: '/post/voteTemplate', var: 'post', bean: post
  }

  /* 
   * Method used to accepted a post.
   */
  def accepted = {

    def post = Post.get(params.id)

    postService.accepted(post)
    render template: '/post/postTemplate', var: 'post', bean: post
  }
}
