<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind</title>		
	</head>
	<body>
		<br />
		<div style="width : 70%; float : left;">
			<h2>Questions (${questionNb})</h2>
			<g:render template="/post/postItemListTemplate" var="post" collection="${questions}" />
		</div>
		
		<div style="width : 28%; float : right;">
			<div>
				<h2>Tags</h2>
				<g:render template="/tag/tagTemplate" var="tag" collection="${tags}" />
			</div>
			<br />
			<div>
				<h2>Awards</h2>				
			</div>
		</div>
		
		<div style="clear : both;">
			<br />
			<g:link controller="Question" action="create">Create question</g:link>
			<g:link controller="Contributor" action="create">Create user</g:link>
			<g:link controller="Tag" action="create">Create tag</g:link>
		</div>
	</body>
</html>
