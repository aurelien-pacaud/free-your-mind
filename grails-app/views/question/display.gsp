<h2>${questions.title}</h2>
<div>${questions.content}<br /></div>
<g:render template="/tag/tagTemplate" var="tag" collection="${questions.tags}" />
<g:render template="/comment/commentTemplate" var="comment" collection="${questions.comments}" />
<h2>Answers</h2>
<g:render template="/post/postTemplate" var="answer" collection="${questions.answers}" />