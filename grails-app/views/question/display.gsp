<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind -- Ask Question</title>		
	</head>
	<body>
		<br />
		<h2>${question.title}</h2>
		by <g:link controller="Contributor" action="show" id="${question.contributor.id}">${question.contributor.login}</g:link> 
		<prettytime:display date="${question.creationDate}" /> 		
		<g:link controller="Comment" action="create">Comment this question</g:link>
		
		<div><br /><markdown:renderHtml>${question.content}</markdown:renderHtml><br /><br /></div>
		<g:render template="/tag/tagTemplate" var="tag" collection="${question.tags}" />
		<br />
		<g:render template="/comment/commentTemplate" var="comment" collection="${question.comments}" />
		
		<g:remoteLink controller="post" action="incMark" id="${question.id}" update="markQuestion">+</g:remoteLink>	
			<span id="markQuestion">${question.mark}</span> 		
		<g:remoteLink controller="post" action="downMark" id="${question.id}" update="markQuestion">-</g:remoteLink>
		
		<br />
		<g:link controller="Answer" action="create">Answered to this question</g:link>
		
		<g:if test="${!question.answers.isEmpty()}">
			<h2>Answers</h2>
			<g:render template="/post/postTemplate" var="answer" collection="${question.answers}" />
		</g:if>
	</body>
</html>