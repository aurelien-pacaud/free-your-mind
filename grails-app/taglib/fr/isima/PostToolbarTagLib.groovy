package fr.isima

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class PostToolbarTagLib {
    
  def springSecurityService
  
  def toolbar = { attrs, body ->
    
    def user = springSecurityService.getCurrentUser()
    def post = attrs.post

    def question = post

    if (post.class.is(Answer))
      question = post.question
    if (post.class.is(Comment))
      if (post.post.class.is(Answer))
      question = post.post.question
      else
        question = post.question

    def deleteParams = ['action': 'delete', 'controller': post.domainClass.name, 'id': post.id, 'title': 'Delete the post',
                        'onclick': "return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
                       ]
    
    def editParams = [action: 'edit', controller: post.domainClass.name, id: post.id, title: 'Edit the post']

    def acceptParams = [action: 'accepted', controller: 'post', id: post.id, update: "post-" + post.id, title: 'Accept this post',
                        onSuccess: 'updateCodeColor()'
                       ]

    def commentParams = [class: 'comment', id: post.id, action: "", controller: ""]

    out << body()

    if (springSecurityService.isLoggedIn() && !question.isClosed) {
      if (post.contributor.id == user.id || (SpringSecurityUtils.ifAnyGranted('ROLE_MODERATOR, ROLE_ADMIN')))
        out << '<span>' << g.link(editParams) { g.img(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam') } << '</span>' 

      if (springSecurityService.isLoggedIn() && !Comment.class.is(post.class))
        out << '<span class="comment" id="' << post.id << '">' << g.img(dir: 'images/icons', file: 'comment.png', plugin: 'famfamfam') << '</span>'

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
    
    def user = springSecurityService.getCurrentUser()
    def post = attrs.post

    out << body()
   
    if (user != null) {
  
      def entries = PostHistory.findAllByTypeAndContributorAndPost(PostType.VOTE_UP, user, post) 
      def down = PostHistory.findAllByTypeAndContributorAndPost(PostType.VOTE_DOWN, user, post) 

      if (entries.isEmpty())
        if(down.isEmpty())
          out << g.remoteLink([controller: 'post', action: 'incMark', id: post.id, update: 'postMark-' + post.id]) { '&#9650;'}
        else
          out << '<span class="postVoteDisable">&#9650;</span>'
      else if (!entries.isEmpty())
        out << '<span class="postVote">&#9650;</span>'
    }
    else
      out << '<span class="postVoteDisable">&#9650;</span>'
  }

  def downVote = { attrs, body ->

    def user = springSecurityService.getCurrentUser()
    def post = attrs.post

    out << body()
    
    if (user != null) {
      
      def entries = PostHistory.findAllByTypeAndContributorAndPost(PostType.VOTE_DOWN, user, post) 
      def up = PostHistory.findAllByTypeAndContributorAndPost(PostType.VOTE_UP, user, post) 

      if (entries.isEmpty())
        if (up.isEmpty())
          out << g.remoteLink([controller: 'post', action: 'downMark', id: post.id, update: 'postMark-' + post.id]) { '&#9660;'}
        else 
          out << '<span class="postVoteDisable">&#9660;</span>'
      else if (!entries.isEmpty())
        out << '<span class="postVote">&#9660;</span>'
    }
    else 
        out << '<span class="postVoteDisable">&#9660;</span>'
  }

  def typePost = { attrs, body ->
    
    def post = attrs.post

    out << body()

    if (Answer.class.is(post.class)) {
      out << "<b>answered</b>"
    }
    else if (Question.class.is(post.class)) {
      out << "<b>asked</b>"
    }
  }
}
