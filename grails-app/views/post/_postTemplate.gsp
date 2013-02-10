<div class="post">
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
    
    <!-- Post accepted ? -->
    <g:if test="${post.isAccepted}">
      <img src="${resource(dir: 'images', file: 'accepted.png')}" alt="Post accepted"/>
    </g:if>
  </div>
    
  <div class="postContent">
    <markdown:renderHtml>${post.content}</markdown:renderHtml>
  </div>
</div>

<!-- Toolbar -->
<div class="postToolbar">
  <g:if test="${user?.id == post.contributor.id}">
     
    <!-- To edit the post -->
    <span>
      <g:link controller="${post.domainClass.name}" action="edit" id="${post.id}">
        <img src="${resource(dir: 'images', file: 'edit.png')}" alt="Edit your question"/>
      </g:link>
    </span>
    
    <!-- To accepted the post -->
    <g:if test="${!post.isAccepted}">
      <span>
        <g:remoteLink controller="Post" action="accepted" id="${post.id}">
          <img src="${resource(dir: 'images', file: 'accepted.png')}" alt="Accept this post"/>
        </g:remoteLink>
      </span>
    </g:if>
  </g:if>
  
  <!-- To comment -->
  <span>
    <g:link controller="Comment" action="create">
      <img src="${resource(dir: 'images', file: 'comment.png')}" alt="Add a comment"/>
    </g:link>
  </span>
</div>

<g:render template="/contributor/contributorPostTemplate" bean="post" />

<div class="clear" ></div>
<hr />
<div>
  <g:if test="${post.comments?.size()}">
    <g:render template="/comment/commentTemplate" var="comment" collection="${post.comments}" />
  </g:if>
</div>

