<div>
  <div style="float : left; width : 46px; height: auto; text-align : center; font-size : 1.5em;">
    <g:remoteLink controller="post" action="incMark" id="${post.id}" update="markQuestion-${post.id}">&#9650;</g:remoteLink>
      <div id="markQuestion-${post.id}">${post.mark}</div> 
    <g:remoteLink controller="post" action="downMark" id="${post.id}" update="markQuestion-${post.id}">&#9660;</g:remoteLink>
  </div>

  <div style="margin-left: 46px;">
    <markdown:renderHtml>${post.content}</markdown:renderHtml>

    <g:render template="/contributor/contributorPostTemplate" bean="post" />
    <g:link controller="Comment" action="create">Add a comment</g:link>

    <g:if test="${user?.id == post.contributor.id}">
      Edit
    </g:if>

    <g:if test="${post.comments?.size()}">
      <g:render template="/comment/commentTemplate" var="comment" collection="${post.comments}" />
    </g:if>
    <hr />
  </div>
  <div class="clear"></div>
</div>
