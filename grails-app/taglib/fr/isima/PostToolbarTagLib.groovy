package fr.isima

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class PostToolbarTagLib {
    
  def springSecurityService
  
  def toolbar = { attrs, body ->
    
    def user = springSecurityService.getCurrentUser()
    def post = attrs.post

    def deleteParams = ['action': 'delete', 'controller': post.domainClass.name, 'id': post.id, 'title': 'Delete the post',
                        'onclick': "return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
                       ]
    
    def editParams = [action: 'edit', controller: post.domainClass.name, id: post.id, title: 'Edit the post']

    def acceptParams = [action: 'accepted', controller: 'post', id: post.id, update: "post-${post.id}", title: 'Accept this post',
                        onSuccess: 'updateCodeColor()'
                       ]

    def commentParams = [class: 'comment', id: post.id, action: "", controller: ""]

    out << body()

    if (springSecurityService.isLoggedIn()) {
      if (post.contributor.id == user.id)
        out << '<span>' << g.link(editParams) { g.img(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam') } << '</span>' 

      if (springSecurityService.isLoggedIn())
        out << '<span class="comment" id="' << post.id << '">' << g.img(dir: 'images/icons', file: 'comment.png', plugin: 'famfamfam') << '</span>'

      println user.authorities

      if (SpringSecurityUtils.ifAnyGranted('ROLE_MODERATOR, ROLE_ADMIN'))
        out << '<span>' << g.link(deleteParams) { g.img(dir: 'images/icons', file: 'cross.png', plugin: 'famfamfam') } << '</span>' 

      if (Answer.class.is(post.class)) {
      if (!post.isAccepted && post.question.contributor.id == user.id)
        out << '<span>' << g.remoteLink(acceptParams) { g.img(dir: 'images/icons', file: 'tick.png', plugin: 'famfamfam') } << '</span>' 
      }
      else if (Question.class.is(post.class)) {
        if (!post.isAccepted && post.contributor.id == user.id)
          out << '<span>' << g.remoteLink(acceptParams) { g.img(dir: 'images/icons', file: 'tick.png', plugin: 'famfamfam') } << '</span>' 
      }
    }
  }

  def upVote = { attrs, body ->



  }

  def downVote = { attrs, body ->


  }
}
