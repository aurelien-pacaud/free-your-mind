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
                        <g:each in="${awards[user.id]}">
                          <span class="label label-inverse"><span class="medal ${it.key.toString().toLowerCase()}">&#9679;</span>
                          ${it.value}
                          </span>
                        </g:each>
                        <br />
			<b>Reputation</b> ${user.reputation}
		</div>
	</div>
</div>
