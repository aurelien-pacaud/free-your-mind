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
			<h1>${question.answers.size()} Answers</h1>
			<div id="answers">
				<g:render template="/post/postTemplate" var="post" collection="${question.answers}"/>
			</div>
		</g:if>
		<br />
		<h2>Your Answer</h2>

                <sec:ifNotLoggedIn>
                  Please logging before answered! <g:link controller="contributor" action="login">Login</g:link>
                </sec:ifNotLoggedIn>
                <sec:ifAllGranted roles="ROLE_USER">
                    <g:formRemote name="answerForm" update="answers" 
                                            url="[controller: 'answer', action: 'add', params: [idC: question.contributor.id, idQ: question.id]]">			
                          <g:textArea name="answerdContent" id="answerdContent"></g:textArea>	
                          <br />
                          <g:submitButton name="submitAnswer" value="Answered" id="submitA"/>
                  </g:formRemote>
                </sec:ifAllGranted>
	</body>
</html>
