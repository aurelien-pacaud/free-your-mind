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
      
      if (request.xhr) {
        
        response.status = 200
        println e
        c.errors.allErrors.each {
          println it
        }
      }

      println 'Save comment error'
    }
  }

  def edit = {

    def comment = Comment.get(params.id)

    render view: "edit", model: [comment: comment, post: comment.post] 
  }

  def update(Long id) {
    
    def comment = Comment.get(id)

    if (!comment) {
      render view: "error404"
    }
    else {
      comment.content = params.content
     
      try {
        postService.update(comment)

        flash.message = "Comment edit with success!"
        
        def question = comment.post

        if (comment.post.class.is(Answer))
          question = comment.post.question

        redirect action: "display", controller: "question", id: question.id, fragment: "post-" + comment.id
      }
      catch (e) {
        
        println e
        comment.errors.allErrors.each {
          println it
        }

        render view: "edit", model: [comment: comment, post: comment.post] 
      }
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
