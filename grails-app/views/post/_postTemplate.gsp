<p>${answer.content}</p>
<div>${answer.creationDate}</div>
<g:render template="/comment/commentTemplate" var="comment" collection="${answer.comments}" />
<hr />
