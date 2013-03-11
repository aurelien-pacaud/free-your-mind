<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind -- Users</title>		
	</head>
	<body>	
		<div>
			<h2><g:message code="global.users.numeroted" args="${[contribCount]}"/></h2>
			<br/>
			<g:render template="contributorItemListTemplate" var="user" collection="${users}" />
	   		<div class="clear"></div>
                        <div class="pagination pull-right">
			  <g:paginate controller="contributor" action="list" total="${contribCount}" max="64" offset="0" omitPrev="true" omitNext="true"/>
			</div>
		</div>
		<br/>	
	</body>
</html>
