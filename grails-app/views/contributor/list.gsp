<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind</title>		
	</head>
	<body style="height: 100%;">	
		<br/>
		<div style="width : 70%; padding-left: 15%;">
			<h2>Users</h2>
			<g:set var="cpt" value="${0}"/>
			<g:each in="${users}" var="user">
			  <div style="float: left; width:25%; height: 90px;">
			  	<tmpl:contributorItemListTemplate user="${user}"/>
			  </div>
			  <g:set var="cpt" value="${cpt + 1}" />
			</g:each>
		</div>
		<br/>	
	</body>
</html>