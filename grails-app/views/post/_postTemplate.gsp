<markdown:renderHtml>${answer.content}</markdown:renderHtml>
<div>${answer.creationDate}</div>
<g:render template="/comment/commentTemplate" var="comment" collection="${answer.comments}" />
<g:link controller="Comment" action="create">Add comment</g:link>
<hr />
