<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind -- Users</title>		
	</head>
	<body>	
		<div>
			<h2><g:message code="user.list.title"/></h2>
			<br/>
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