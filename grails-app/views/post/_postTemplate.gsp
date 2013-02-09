<div style="min-height: 170px;">
  <div style="float : left; width : 46px; text-align : center; font-size : 1.5em; margin-right : 10px;">
    
    <!-- Buttons to up or down vote -->
    <div class="${post.isAccepted ? 'postAccepted' : ''}">
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
    
    <g:if test="${user?.id == post.contributor.id}">
      <div>
        <g:link controller="${post.domainClass.name}" action="edit" id="${post.id}">
          <img src="${resource(dir: 'images', file: 'edit.png')}" alt="Edit your question"/>
        </g:link>
      </div>
      <g:if test="${!post.isAccepted}">
        <div>
          <g:remoteLink controller="Post" action="accepted" id="${post.id}">
            <img src="${resource(dir: 'images', file: 'accepted.png')}" alt="Accept this post"/>
          </g:remoteLink>
        </div>
      </g:if>
    </g:if>
    <div>
      <g:link controller="Comment" action="create">
        <img src="${resource(dir: 'images', file: 'comment.png')}" alt="Add a comment"/>
      </g:link>
    </div>
  </div>

  <div style="margin-left: 56px;">
    <markdown:renderHtml>${post.content}</markdown:renderHtml>

    <div>
      <g:if test="${post.comments?.size()}">
        <g:render template="/comment/commentTemplate" var="comment" collection="${post.comments}" />
      </g:if>
    </div>
  </div>
</div>
<g:render template="/contributor/contributorPostTemplate" bean="post" />
<br />
<div class="clear" ></div>
<hr />
