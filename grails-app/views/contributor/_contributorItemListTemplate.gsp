<div class="usersLine">
	<div class="itemUser">
		<div style="float:left;padding-right: 5px">
			<g:if test="${user.avatar}">
			  	<img class="avatar" src="${createLink(controller:'contributor', action:'avatar_image', id:user.ident())}" />
			</g:if>
			<g:else>
				<g:img dir="images" file="avatar.png" width="64" height="64"/>
			</g:else>
		</div>
		<div class="userItemList">
			<g:link controller="Contributor" action="show" id="${user.id}">${user.username}</g:link>
			<br/>
			${user.location}
			<br/>
			${user.reputation}
		</div>
	</div>
</div>