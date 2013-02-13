package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class PostController {

  //static scaffold = true

  def postService

  def display = {

    [post: Question.getAll()]
  }

  def incMark = {

    postService.incMark(Post.get(params.get("id")))
    render Post.get(params.get("id")).mark
  }

  def downMark = {

    postService.downMark(Post.get(params.get("id")))
    render Post.get(params.get("id")).mark
  }

  def accepted = {

    postService.accepted(Post.get(params.id))
    render template: '/post/postTemplate', var: 'post', bean: Post.get(params.id)
  }
}
