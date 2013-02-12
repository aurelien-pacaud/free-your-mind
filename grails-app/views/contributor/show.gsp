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
				<h2>${user.username}</h2>
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
							<td> ${user.birthDate}</td>
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
			
			<g:javascript plugin="twitter-bootstrap" src="bootstrap-tab.js"/>
			<div class="activity">
				<ul class="nav nav-tabs" id="myTab">
				  <li><a href="#home" data-toggle="tab">Home</a></li>
				  <li><a href="#profile" data-toggle="tab">Profile</a></li>
				  <li><a href="#messages" data-toggle="tab">Messages</a></li>
				  <li><a href="#settings" data-toggle="tab">Settings</a></li>
				</ul>
				<div class="tab-content">
				  <div class="tab-pane active" id="home">Home</div>
				  <div class="tab-pane" id="profile">Profile</div>
				  <div class="tab-pane" id="messages">Message</div>
				  <div class="tab-pane" id="settings">Settings</div>
				</div>
			</div>
			<script type="text/javascript">
				$('#myTab a[href="#home"]').tab('show')
			</script>
		</div>
	</body>
</html>