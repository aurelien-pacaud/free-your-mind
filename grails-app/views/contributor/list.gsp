<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind</title>		
	</head>
	<body>	
		<br/>
		<div class="content">
			<h2>Users</h2>
			<br/>
			<g:link controller="contributor" action="create">Create a new user</g:link>
			<br/><br/>
			<g:set var="cpt" value="${0}"/>
			<g:each in="${users}" var="user">
			  <div class="usersLine">
			  	<tmpl:contributorItemListTemplate user="${user}"/>
			  </div>
			  <g:set var="cpt" value="${cpt + 1}" />
			</g:each>
		</div>
		<br/>	
	</body>
</html>