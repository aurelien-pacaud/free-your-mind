show 


<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind -- User Profil</title>		
	</head>
	<body>	
		<div class="content">
			<div class="summary">
				<h2>${user.firstName}</h2>
				<div class="leftCol">
					<center>
						<g:img dir="images" file="avatar.png"/>
						<br/>
						${user.reputation}
						<br/>
						reputation
					</center>
				</div>
				<div class="rightCol">
					<table>
						<tr>
							<td style="width:30%">bio</td>
							<td style="width:30%">website</td>
							<td style="width:30%"></td>
						</tr>
						<tr>
							<td></td>
							<td>location</td>
							<td>${user.location}</td>
						</tr>
						<tr>
							<td></td>
							<td>age</td>
							<td>${new Date() - user.birthDate }</td>
						</tr>
						<tr>
							<td>visits</td>
							<td>member for</td>
							<td>${user.registrationDate}</td>
						</tr>
						<tr>
							<td></td>
							<td>seen</td>
							<td>${user.lastConnectionDate}</td>
						</tr>
						<tr>
							<td>stats</td>
							<td>profile views</td>
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