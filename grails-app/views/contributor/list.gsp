<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind -- Users</title>		
	</head>
	<body>	
		<div class="content">
			<h2>Users</h2>
			<br/>
			<g:link controller="contributor" action="create">Create a new user</g:link>
			<br/><br/>
			<table>
				<tr class="usersLine">
					<g:set var="cpt" value="${0}"/>
					<g:each in="${users}" var="user">
						<g:if test="${ cpt % 4 == 0 && cpt != 0}" >
						  </tr>
						  <tr class="usersLine">
						</g:if>
						<td class="userItem">
							<tmpl:contributorItemListTemplate user="${user}"/>
						</td>
					  	<g:set var="cpt" value="${cpt + 1}" />
					</g:each>
				</tr>	
			</table>
		</div>
		<br/>	
	</body>
</html>