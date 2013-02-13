<div class="contributoItemPost">
	<g:if test="${post.isAccepted == false }">
		<div class="contributorPostVote">
	</g:if>
	<g:else>
		<div class="contributorPostVoteAccepted">
	</g:else>
		${post.mark}
	</div>	
	<div class="contributorPostTitle">		
		<g:link class="link" controller="Question" action="display" id="${post.question.id}">
	        <b>${post.question.title}</b>
        </g:link>	
	</div>
	<div style="clear : both;"></div>
	<hr id="contributorPostSeparator"/>
</div>
