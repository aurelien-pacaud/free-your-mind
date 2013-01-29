<h2>${questions.title}</h2>
<div>${questions.content}<br /></div>
<g:render template="/tag/tagTemplate" var="tag" collection="${questions.tags}" />
<g:render template="/comment/commentTemplate" var="comment" collection="${questions.comments}" />
<br />
<g:link controller="Comment" action="create">Add comment</g:link>
<g:link controller="Answer" action="create">Add answer</g:link>
<h2>Answers</h2>
<g:render template="/post/postTemplate" var="answer" collection="${questions.answers}" />