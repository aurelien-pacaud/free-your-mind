<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind</title>		
	</head>
	<body>
		<br />		
		<div style="width : 28%; float : left;">
			<div>
				<h2>Tags <g:render template="/tag/tagTemplate" var="tag" bean="${tag}" /></h2>				
			</div>
		</div>
		
		<div style="width : 70%; float : right;">
			<h2>Related questions</h2>
			<g:render template="/post/postItemListTemplate" var="post" collection="${tag.questions}" />
		</div>
	</body>
</html>