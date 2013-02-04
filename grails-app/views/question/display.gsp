<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind -- Ask Question</title>		
	</head>
	<body>	
		<h2>${question.title} <g:render template="/tag/tagTemplate" var="tag" collection="${question.tags}" /></h2>	
		<g:render template="/post/postTemplate" var="post" collection="${question}" />
		<br />
		
		<g:if test="${!question.answers.isEmpty()}">
			<h2>${question.answers.size()} Answers</h2>
			<g:render template="/post/postTemplate" var="post" collection="${question.answers}"/>
		</g:if>
		<div id="newAnswer"></div>	
		<br />
		<h2>Your Answer</h2>
		<g:formRemote name="answerForm" update="newAnswer" 
					  url="[controller: 'answer', action: 'add', params: [idC: question.contributor.id, idQ: question.id]]">			
			<g:textArea name="answerdContent" id="answerdContent"></g:textArea>	
			<br />
			<g:submitButton name="submitAnswer" value="Answerd" id="submitA"/>
		</g:formRemote>
	</body>
</html>