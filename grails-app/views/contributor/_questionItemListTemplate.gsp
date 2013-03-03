<div class="contributoItemPost">
	<g:if test="${question.isAccepted == false }">
		<div class="contributorPostVote">
	</g:if>
	<g:else>
		<div class="contributorPostVoteAccepted">
	</g:else>
		${question.mark}
	</div>	
	<div class="contributorPostTitle">		
		<g:link class="link" controller="Question" action="display" id="${question.id}">
	        <b>${question.title}</b>
        </g:link>	
	</div>
	<div style="clear : both;"></div>
	<hr id="contributorPostSeparator"/>
</div>
