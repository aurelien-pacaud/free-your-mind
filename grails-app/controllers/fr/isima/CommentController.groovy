package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class CommentController {

  def add = {
    
    def post = Post.get(params.idPost)
    def content = params.commentContent

    def c = new Comment(content: content, post: post, contributor: getAuthenticatedUser())

    if (c.save()) {		

      render template: 'commentTemplate', collection: Post.get(params.idPost).comments, var: 'comment'
    }
    else {
      c.errors.each {
        println it
      }
    }
  }
}
