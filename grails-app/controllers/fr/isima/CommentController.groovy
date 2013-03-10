package fr.isima

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class CommentController {

  def postService

  def save = {

    def post = Post.get(params.idPost)

    def comment = new Comment(content: params.content, post: post)

    try {

      postService.save(comment, PostType.COMMENTED)
      
      flash.message = message(code: "creation.success")
      render template: 'commentTemplate', collection: Post.get(params.idPost).comments, var: 'comment'
    }
    catch (e) {
      
      log.error e
    }
  }

  @Secured(['IS_AUTHENTICATED_FULLY'])
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
      comment.properties = params
     
      try {
        postService.update(comment)

        flash.message = message(code: "edition.success")
        
        def question = comment.post

        if (comment.post.class.is(Answer))
          question = comment.post.question

        redirect action: "display", controller: "question", id: question.id, fragment: "post-" + comment.id
      }
      catch (e) {
        
        log.error e
        comment.errors.each {
          log.error it
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

    flash.message = message(code: "deletion.success")
    redirect action: "display", controller: "question", id: question.id
  }

}
