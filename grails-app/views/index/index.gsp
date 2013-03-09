<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind</title>		
	</head>
	<body>
		<div style="width : 70%; float : left;">
			<h2><g:message code="global.questions"/> (${questionNb})</h2>
			<g:render template="/post/postItemListTemplate" var="post" collection="${questions}" />
		</div>
		
		<div style="width : 28%; float : right;">
			<div>
				<h2><g:message code="global.tags"/></h2>
				<g:render template="/tag/tagTemplateWithNbofQuestion" var="tag" collection="${tags}" />
                                <div class="clear"> </div>
                                <br />
                                <g:link controller="tag" action="list"><g:message code="global.view.more"/></g:link>
			</div>
			
			<div style="clear : both;"></div>
			<br />
			
			<div>
				<h2><g:message code="global.awards"/></h2>	
                                <g:each in="${awardsHistory}">                                  
                                  <g:render template="/award/awardTemplate" bean="${it.award}" var="award" />
                                  <g:link controller="contributor" action="show" id="${it.contributor.id}">${it.contributor.username}</g:link>
                                  <br />
                                </g:each>
                                <br />
                                <g:link controller="award" action="list"><g:message code="global.view.more"/></g:link>
			</div>
		</div>
		
		<div style="clear : both;">
			<br />
			<g:link controller="Question" action="create">Create question</g:link>
			<g:link controller="Contributor" action="create">Create user</g:link>
			<g:link controller="Tag" action="create">Create tag</g:link>
			<g:link controller="Award" action="create">Create award</g:link>
		</div>
	</body>
</html>
