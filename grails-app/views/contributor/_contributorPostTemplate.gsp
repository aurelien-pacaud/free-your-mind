<span class="userPost">
	<prettytime:display date="${post.creationDate}" /> by
	<g:link controller="Contributor" action="show" id="${post.contributor.id}">${post.contributor.username}</g:link>
</span>