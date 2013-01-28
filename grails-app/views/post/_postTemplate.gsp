<p>${answer.content}</p>
<div>${answer.creationDate}</div>
<g:link controller="Comment" action="create">Add comment</g:link>
<g:render template="/comment/commentTemplate" var="comment" collection="${answer.comments}" />
<hr />
