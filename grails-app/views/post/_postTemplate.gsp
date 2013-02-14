<%@page import="fr.isima.Answer" %>
<div id="post-${post.id}">
  <div class="post ${!post.isAccepted ? '' : 'postAccepted'}">
    <div class="postMark">
      <!-- Buttons to up or down vote -->
      <div>
        <g:remoteLink controller="post" action="incMark" id="${post.id}" update="markQuestion-${post.id}">
          &#9650;
        </g:remoteLink>
          <div id="markQuestion-${post.id}">
            ${post.mark}
          </div> 
        <g:remoteLink controller="post" action="downMark" id="${post.id}" update="markQuestion-${post.id}">
          &#9660;
        </g:remoteLink>
      </div>
    </div>
    <div class="postContent">
      <div style="float: left; width : 3px; background-color : red"></div>
      <markdown:renderHtml>${post.content}</markdown:renderHtml>
    </div>
  </div>

  <!-- Toolbar -->
  <div class="postToolbar">
    <g:if test="${sec.loggedInUserInfo(field: 'id') == post.contributor.id.toString()}">
       
      <!-- To edit the post -->
      <span>
        <g:link controller="${post.domainClass.name}" action="edit" id="${post.id}" title="Edit the post">
          <img src="${fam.icon(name: 'pencil')}" alt="Edit your question"/>
        </g:link>
      </span>
      
      <!-- To accepted the post -->
      <g:if test="${!post.isAccepted}" > 
        <span>
          <g:remoteLink controller="post" action="accepted" id="${post.id}" update="post-${post.id}" onSuccess="updateCodeColor()" >
            <img src="${fam.icon(name: 'tick')}" alt="Accept this post"/>
          </g:remoteLink>
        </span>
      </g:if>
    </g:if>
    
    <!-- To comment -->
    <span>
      <a class="comment" title="Add a comment" id="${post.id}">
        <img src="${fam.icon(name: 'comment')}" alt="Add a comment"/>
      </a>
    </span>
    <span>
      <g:link action="delete" controller="${post.domainClass.name}" title="Delete post" id="${post.id}" 
              onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
        <img src="${fam.icon(name: 'cross')}" alt="Add a comment"/>
      </g:link>
    </span>
  </div>

  <g:render template="/contributor/contributorPostTemplate" bean="post" />

  <div class="clear" ></div>
  <hr />
  <div id="comments-${post.id}">
    <g:if test="${!post.comments?.isEmpty()}">
      <g:render template="/comment/commentTemplate" var="comment" collection="${post.comments}" />
    </g:if>
  </div>

  <div id="comment-${post.id}" class="commentTextArea">
    <g:formRemote name="commentForm" update="comments-${post.id}" url="[controller: 'comment', action: 'add', params: [idPost: post.id]]"
                  onSuccess="\$('#comment-${post.id}').hide();">
      <g:textArea name="commentContent" id="commentContent" class="commentContent"></g:textArea>
      <g:submitButton name="addComment" value="Add comment" style="float : right;"/>
    </g:formRemote>
  </div>

  <div><br /><br /><br /></div>
</div>


