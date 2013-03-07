package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class PostController {

  def postService
  def postHistoryService

  def incMark = {

    def post = Post.get(params.id)

    postService.incMark(post)

    if (post.class.is(Comment))
      render template: '/comment/voteTemplate', var: 'post', bean: post
    else
      render template: '/post/voteTemplate', var: 'post', bean: post
  }

  def downMark = {
    
    def post = Post.get(params.id)

    postService.downMark(post)

    if (post.class.is(Comment))
      render template: '/comment/voteTemplate', var: 'post', bean: post
    else
      render template: '/post/voteTemplate', var: 'post', bean: post
  }

  def accepted = {

    def post = Post.get(params.id)

    postService.accepted(post)
    render template: '/post/postTemplate', var: 'post', bean: post
  }
}
