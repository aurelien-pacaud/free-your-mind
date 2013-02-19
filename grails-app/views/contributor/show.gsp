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
				<br/>
				<div class="leftCol">
					<center>
						<g:if test="${user.avatar}">
						  	<img class="avatar_large" src="${createLink(controller:'contributor', action:'avatar_image', id:user.ident())}" />
						</g:if>
						<g:else>
							<g:img dir="images" file="avatar.png" width="64" height="64"/>
						</g:else>
						<sec:ifLoggedIn>
							<g:if test="${sec.loggedInUserInfo(field: 'id') == user.id.toString()}">
								<br/>
								<g:link action="edit_avatar" controller="contributor" id="${user?.id}"> Change Avatar</g:link>
							</g:if>
						</sec:ifLoggedIn>
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
							<td> ${user.age} years old</td>
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
				<ul class="nav nav-tabs" id="myTab">
				  <li><a href="#summary" data-toggle="tab">Summary</a></li>
				  <li><a href="#answers" data-toggle="tab">Answers</a></li>
				  <li><a href="#questions" data-toggle="tab">Questions</a></li>
				  <li><a href="#comments" data-toggle="tab">Comments</a></li>
				  <li><a href="#tag" data-toggle="tab">Tags</a></li>
				  <li><a href="#awards" data-toggle="tab">Awards</a></li>
				  <li><a href="#activity" data-toggle="tab">Activity</a></li>
				</ul>
				<div class="tab-content">
				  <div class="tab-pane active" id="summary">
				  	<h3>Summary</h3>
				  </div>
				  <div class="tab-pane" id="answers">
				  	<h3>${answers.size()} Answers</h3>
				  	<br/>
			  		<g:render template="answerItemListTemplate" var="post" collection="${answers}" />
				  </div>
				  <div class="tab-pane" id="questions">
				  	<h3>${questions.size()} Questions</h3>
				  	<br/>
			  		<g:render template="/post/postItemListTemplate" var="post" collection="${questions}" />
				  </div>
				  <div class="tab-pane" id="comments">
				  	<h3>${comments.size()} Comments</h3>
				  	<br/>
			  		<g:render template="commentItemListTemplate" var="comment" collection="${comments}" />
				  </div>
				  <div class="tab-pane" id="tag">
				  	<h3>${tags.size()} Tags</h3>
				  	<br/>
				  	<g:render template="tagTemplateWithNbofQuestion" var="tag" collection="${tags}"/>
				  	<div style="clear: both"></div>
				  	<br/>
				  </div>
				  <div class="tab-pane" id="awards">
				  	<h3>${awards.size()} Awards</h3>
				  </div>
				  <div class="tab-pane" id="activity">
				  	<h3>Activity</h3>
				  </div>
				</div>
			</div>
			<script type="text/javascript">
				$('#myTab a[href="#answers"]').tab('show')
			</script>
		</div>
	</body>
</html>