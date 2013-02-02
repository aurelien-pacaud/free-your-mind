<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind -- Users</title>		
	</head>
	<body>	
		<br/>
		<div class="content">
			<h2>Users</h2>
			<br/>
			<g:link controller="contributor" action="create">Create a new user</g:link>
			<br/><br/>
			<g:render template="contributorItemListTemplate" var="user" collection="${users}"/>
			<div class="clean"></div>
		</div>
		<br/>	
	</body>
</html>