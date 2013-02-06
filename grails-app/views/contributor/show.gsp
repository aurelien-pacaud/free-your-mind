show 


<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind -- User Profil</title>		
	</head>
	<body>	
		<div>
			<div class="summary">
				<h2>${user.firstName}</h2>
				<div class="leftCol">
					<center>
						<g:img dir="images" file="avatar.png"/>
						<br/>
						${user.reputation}
						<br/>
						<g:message code="user.profil.summary.reputation"/>
					</center>
				</div>
				<div class="rightCol">
					<table>
						<tr>
							<td style="width:30%"><g:message code="user.profil.summary.bio"/> </td>
							<td style="width:30%"><g:message code="user.profil.summary.webSite"/></td>
							<td style="width:30%"></td>
						</tr>
						<tr>
							<td></td>
							<td><g:message code="user.profil.summary.location"/></td>
							<td>${user.location}</td>
						</tr>
						<tr>
							<td></td>
							<td><g:message code="user.profil.summary.age"/></td>
							<td>${new Date() - user.birthDate }</td>
						</tr>
						<tr>
							<td><g:message code="user.profil.summary.visits"/></td>
							<td><g:message code="user.profil.summary.memberFor"/></td>
							<td>${user.registrationDate}</td>
						</tr>
						<tr>
							<td></td>
							<td><g:message code="user.profil.summary.seen"/></td>
							<td>${user.lastConnectionDate}</td>
						</tr>
						<tr>
							<td><g:message code="user.profil.summary.stats"/></td>
							<td><g:message code="user.profil.summary.profil.views"/></td>
							<td>${user.nbProfileViews}</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="activity">
				ACTIVITY
			</div>
		</div>
	</body>
</html>