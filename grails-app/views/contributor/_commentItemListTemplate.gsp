<%@page import="fr.isima.Answer"%>
<div class="contributoItemPost">
	<div class="contributorPostVote">
		${comment.mark}
	</div>	
	<div class="contributorPostTitle">		
		<g:if test="${Answer.class.is(comment.post.class)}">
	        <g:link class="link" controller="Question" action="display" id="${comment.post.question.id}">
		        <b>${comment.post.question.title}</b>
	        </g:link>
	    </g:if>
	    <g:else>
	   		<g:link class="link" controller="Question" action="display" id="${comment.post.id}">
		        <b>${comment.post.title}</b>
	        </g:link>
	    </g:else>
	</div>
	<div style="clear : both;"></div>
	<hr id="contributorPostSeparator"/>
</div>