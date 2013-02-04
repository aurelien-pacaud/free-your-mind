<div>
	<div style="float : left; width : 40px; vertical-align : middle; text-align : center;">
		<g:remoteLink controller="post" action="incMark" id="${post.id}" update="markQuestion-${post.id}">+</g:remoteLink>	<br />
			<div id="markQuestion-${post.id}">${post.mark}</div> 
		<g:remoteLink controller="post" action="downMark" id="${post.id}" update="markQuestion-${post.id}">-</g:remoteLink>
	</div>		
	<markdown:renderHtml>${post.content}</markdown:renderHtml>
	
	
	<g:render template="/contributor/contributorPostTemplate" bean="post" />
	<g:link controller="Comment" action="create">Add a comment</g:link>
	
	<g:if test="${post.comments?.size()}">
		<g:render template="/comment/commentTemplate" var="comment" collection="${post.comments}" />
	</g:if>
	<hr />
</div>