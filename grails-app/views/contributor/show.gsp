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
				<g:if test="${sec.loggedInUserInfo(field: 'id') == user.id.toString()}">
					<div style="float:right;position: relative;top: -40px;">
						<g:link action="edit" controller="contributor" id="${user?.id}">
							<img src="${fam.icon(name: 'pencil')}" alt="Edit profil"/>
						</g:link>
					</div>
				</g:if>
				<g:else>
					<sec:ifAllGranted roles="ROLE_ADMIN">
						<div style="float:right;position: relative;top: -40px;">
							<g:link action="edit" controller="contributor" id="${user?.id}">
								<img src="${fam.icon(name: 'pencil')}" alt="Edit profil"/>
							</g:link>
						</div>
					</sec:ifAllGranted>
				</g:else>
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
								<g:link action="edit_avatar" controller="contributor" id="${user?.id}">
									<g:message code="user.profile.change.avatar" />
								</g:link>
							</g:if>
						</sec:ifLoggedIn>
						<br/>
						${user.reputation}
						<br/>
						<g:message code="user.profile.summary.reputation"/>
					</center>
				</div>
				<div class="rightCol">
					<table>
						<tr>
							<td style="width:30%"><g:message code="user.profile.summary.bio"/> </td>
							<td style="width:30%"><g:message code="user.profile.summary.webSite"/></td>
							<td style="width:30%"></td>
						</tr>
						<tr>
							<td></td>
							<td><g:message code="user.profile.summary.location"/></td>
							<td>${user.location}</td>
						</tr>
						<tr>
							<td></td>
							<td><g:message code="user.profile.summary.age"/></td>
							<td> ${user.age} <g:message code="user.profile.age"/></td>
						</tr>
						<tr>
							<td><g:message code="user.profile.summary.visits"/></td>
							<td><g:message code="user.profile.summary.memberFor"/></td>
							<td><prettytime:display date="${user.registrationDate}"></prettytime:display></td>
						</tr>
						<tr>
							<td></td>
							<td><g:message code="user.profile.summary.seen"/></td>
							<td><prettytime:display date="${user.lastConnectionDate}"></prettytime:display></td>
						</tr>
						<tr>
							<td><g:message code="user.profile.summary.stats"/></td>
							<td><g:message code="user.profile.summary.profil.views"/></td>
							<td>${user.nbProfileViews}</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class="activity">
				<ul class="nav nav-tabs" id="myTab">
				  <li><a href="#summary" data-toggle="tab"><g:message code="user.profile.tab.summary"/></a></li>
				  <li><a href="#questions" data-toggle="tab"><g:message code="user.profile.tab.questions"/></a></li>
				  <li><a href="#answers" data-toggle="tab"><g:message code="user.profile.tab.answers"/></a></li>
				  <li><a href="#comments" data-toggle="tab"><g:message code="user.profile.tab.comments"/></a></li>
				  <li><a href="#tag" data-toggle="tab"><g:message code="user.profile.tab.tags"/></a></li>
				  <li><a href="#awards" data-toggle="tab"><g:message code="user.profile.tab.awards"/></a></li>
				  <li><a href="#activity" data-toggle="tab"><g:message code="user.profile.tab.activity" args="[2]"/></a></li>
				</ul>
				<div class="tab-content">
				  <div class="tab-pane active" id="summary">
				  	<g:render template="summaryTemplate"/>
					<div class="clear"></div>				  	
				  </div>
				  <div class="tab-pane" id="answers">
			  		<h3 class="summaryHeader">${answers?.size()} <g:message code="user.profile.tab.answers"/></h3>
					<g:render template="answerItemListTemplate" var="post" collection="${answers}" />
					<div class="clear"></div>
				  </div>
				  <div class="tab-pane" id="questions">
				  	<h3>${questions.size()} <g:message code="user.profile.tab.questions"/></h3>
			  		<g:render template="/post/postItemListTemplate" var="post" collection="${questions}" />
			  		<div class="clear"></div>
				  </div>
				  <div class="tab-pane" id="comments">
			  		<h3 class="summaryHeader">${comments.size()} <g:message code="user.profile.tab.comments"/></h3>
					<g:render template="commentItemListTemplate" var="comment" collection="${comments}"></g:render>
					<div class="clear"></div>
				  </div>
				  <div class="tab-pane" id="tag">
				  	<h3 class="summaryHeader">${tags.size()} <g:message code="user.profile.tab.tags"/></h3>
					<g:render template="tagItemListTemplate" var="tag" collection="${tags}"/>
				  	<div style="clear: both"></div>
				  </div>
				  <div class="tab-pane" id="awards">
				  	<h3>${awards.size()} <g:message code="user.profile.tab.awards"/></h3>
					<g:render template="awardItemListTemplate" var="h" collection="${awards}" />
					<div class="clear"></div>
				  </div>
				  <div class="tab-pane" id="activity">
					<h3 class="summaryHeader">${actions?.size()} <g:message code="user.profile.tab.activity" args="[actions.size()]"/></h3>
					<g:render template="activityItemListTemplate" var="action" collection="${actions}" />
					<div class="clear"></div>
				  </div>
				</div>
			</div>
			<script type="text/javascript">
				$('#myTab a[href="#summary"]').tab('show')
			</script>
		</div>
	</body>
</html>
