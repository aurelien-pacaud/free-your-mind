<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind -- Ask Question</title>		
	</head>
	<body>
		<h2>${questions.title}</h2>
		by <g:link controller="Contributor" action="show" id="${questions.contributor.id}">${questions.contributor.login}</g:link> 
		<prettytime:display date="${questions.creationDate}" /> 		
		<g:link controller="Comment" action="create">Comment this question</g:link>
		
		<div><br />${questions.content}<br /><br /></div>
		<g:render template="/tag/tagTemplate" var="tag" collection="${questions.tags}" />
		<br />
		<g:render template="/comment/commentTemplate" var="comment" collection="${questions.comments}" />
		<br />
		<g:link controller="Answer" action="create">Answered to this question</g:link>
		
		<g:if test="${!questions.answers.isEmpty()}">
			<h2>Answers</h2>
			<g:render template="/post/postTemplate" var="answer" collection="${questions.answers}" />
		</g:if>
	</body>
</html>