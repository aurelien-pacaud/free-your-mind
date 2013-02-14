package fr.isima

/*<g:if test="${!post.isAccepted}" > 
        
    <g:if test="${sec.loggedInUserInfo(field: 'id') == post.contributor.id.toString()}">
       
      <!-- To edit the post -->
         </g:if>
         
    <!-- To comment -->
      */

class PostToolbarTagLib {
    
  def springSecurityService
  
  def toolbar = { attrs, body ->
    
    def user = springSecurityService.getCurrentUser()
    def post = attrs.post

    def comment = """\
    <span>
      <a class="comment" title="Add a comment" id="${post.id}">
        <img src="${fam.icon(name: 'comment')}" alt="Add a comment"/>
      </a>
    </span>
    """

    def accept = """\
    <span>
      <g:remoteLink controller="post" action="accepted" id="${post.id}" update="post-${post.id}" onSuccess="updateCodeColor()" >
        <img src="${fam.icon(name: 'tick')}" alt="Accept this post"/>
      </g:remoteLink>
    </span>
    """
    
    def delete = """\
    <span>
      <g:link action="delete" controller="${post.domainClass.name}" title="Delete post" id="${post.id}" 
              onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
        <img src="${fam.icon(name: 'cross')}" alt="Add a comment"/>
      </g:link>
    </span>
    """

    def edit = """\
    <span>
      <g:link controller="${post.domainClass.name}" action="edit" id="${post.id}" title="Edit the post">
        <img src="${fam.icon(name: 'pencil')}" alt="Edit your question"/>
      </g:link>
    </span>
    """

    out << body()

    if (springSecurityService.isLoggedIn()) {
      if (post.contributor.id == user.id)
        out << edit

      if (springSecurityService.isLoggedIn())
        out << comment

      if (user.getAuthorities().contains('ROLE_USER') || user.getAuthorities().contains('ROLE_ADMIN'))
        out << delete

      if (Answer.class.is(post.class)) {
      if (post.question.contributor.id == user.id)
         out << accept
      }
      else if (Question.class.is(post.class)) {
        if (post.contributor.id == user.id)
          out << accept
      }
    }
  }
}
