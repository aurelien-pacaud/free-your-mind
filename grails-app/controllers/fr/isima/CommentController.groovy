package fr.isima

import org.springframework.dao.DataIntegrityViolationException

class CommentController {

  def commentService
  def postService

  def add = {

    def post = Post.get(params.idPost)
    def content = params.commentContent

    def c = new Comment(content: content, post: post, contributor: getAuthenticatedUser())

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

  def delete = {

    def comment  = Comment.get(params.id)
    def question = comment.post

    if (comment.post.class.is(Answer))
      question = comment.post.question

    postService.delete(comment)

    flash.message = "Comment deleted with success!"
    redirect action: "display", controller: "question", id: question.id
  }

}
