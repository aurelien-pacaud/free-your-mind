package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class CommentController {

  def commentService

  def add = {

    def post = Post.get(params.idPost)
    def content = params.commentContent

    def c = new Comment(content: content, post: post, contributor: getAuthenticatedUser(), mark: "3")

    try {

      commentService.save(c)
      
      render template: 'commentTemplate', collection: Post.get(params.idPost).comments, var: 'comment'
    }
    catch (e) {
   
      println e
      c.errors.allErrors.each {
        println it
      }

      println 'Save comment error'
    }
  }
}
