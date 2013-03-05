<%@page import="fr.isima.PostType"%>
<%@page import="fr.isima.Answer"%>
<div class="contributoItemPost">
	<g:if test="${action.type ==  PostType.ASKED}" >
		<div style="float:left; width:100px;margin-right:10px;">
			<prettytime:display date="${action.date}"></prettytime:display>
		</div>
		<div style="float:left;margin-left:10px;width:100px;text-align: center" ><g:message code="user.profile.activity.asked"/></div>
		<div style="float:left;margin-left:10px;">		
			<g:link class="link" controller="Question" action="display" id="${action.post.id}">
		        <b>${action.post.title}</b>
	        </g:link>	
		</div>
	</g:if>
	
	<g:elseif test="${action.type == PostType.ANSWERED}">
		<div style="float:left; width:100px;margin-right:10px;">
			<prettytime:display date="${action.date}"></prettytime:display>
		</div>
		<div style="float:left;margin-left:10px;width:100px;text-align: center" ><g:message code="user.profile.activity.answered"/></div>
		<div style="float:left;margin-left:10px;">		
			<g:link class="link" controller="Question" action="display" id="${action.post.question.id}">
		        <b>${action.post.question.title}</b>
	        </g:link>	
		</div>
	</g:elseif>
	
	<g:elseif test="${action.type == PostType.REVISION}">
		<div style="float:left; width:100px;margin-right:10px;">
			<prettytime:display date="${action.date}"></prettytime:display>
		</div>
		<div style="float:left;margin-left:10px;width:100px;text-align: center" ><g:message code="user.profile.activity.revised"/></div>
		<div style="float:left;margin-left:10px;">		
			<g:if test="${Answer.class.is(action.post.class)}">
		        <g:link class="link" controller="Question" action="display" id="${action.post.question.id}" fragment="post-${action.post.id}">
			        <b>${action.post.question.title}</b>
		        </g:link>
		    </g:if>
		    <g:else>
		   		<g:link class="link" controller="Question" action="display" id="${action.post.id}" fragment="post-${action.post.id}">
			        <b>${action.post.title}</b>
		        </g:link>
		    </g:else>
		</div>
	</g:elseif>
	
	<g:elseif test="${action.type == PostType.ACCEPTED}">
		<div style="float:left;width:100px;margin-right:10px;">
			<prettytime:display date="${action.date}"></prettytime:display>
		</div>
		<div style="float:left;margin-left:10px;width:100px;text-align: center" class="label label-success"><g:message code="user.profile.activity.accepted"/></div>
		<div style="float:left;margin-left:10px;">		
			<g:if test="${Answer.class.is(action.post.class)}">
		        <g:link class="link" controller="Question" action="display" id="${action.post.question.id}" fragment="post-${action.post.id}">
			        <b>${action.post.question.title}</b>
		        </g:link>
		    </g:if>
		    <g:else>
		   		<g:link class="link" controller="Question" action="display" id="${action.post.id}" fragment="post-${action.post.id}">
			        <b>${action.post.title}</b>
		        </g:link>
		    </g:else>
		</div>
	</g:elseif>
	
	<g:elseif test="${action.type == PostType.COMMENTED}">
		<div style="float:left;width:100px;margin-right:10px;">
			<prettytime:display date="${action.date}"></prettytime:display>
		</div>
		<div style="float:left;margin-left:10px;width:100px;text-align: center"><g:message code="user.profile.activity.commented"/></div>
		<div style="float:left;margin-left:10px;">		
			<g:if test="${Answer.class.is(action.post.post.class)}">
		        <g:link class="link" controller="Question" action="display" id="${action.post.post.question.id}" fragment="post-${action.post.id}">
			        <b>${action.post.content}</b>
		        </g:link>
		    </g:if>
		    <g:else>
		   		<g:link class="link" controller="Question" action="display" id="${action.post.post.id}" fragment="post-${action.post.id}">
			        <b>${action.post.content}</b>
		        </g:link>
		    </g:else>
		</div>
	</g:elseif>
	
	<g:elseif test="${action.type == PostType.VOTE_UP}">
		<div style="float:left;width:100px;margin-right:10px;">
			<prettytime:display date="${action.date}"></prettytime:display>
		</div>
		<div style="float:left;margin-left:10px;width:100px;text-align: center"><g:message code="user.profile.activity.vote.up"/></div>
		<div style="float:left;margin-left:10px;">		
			<g:if test="${Answer.class.is(action.post.class)}">
		        <g:link class="link" controller="Question" action="display" id="${action.post.question.id}" fragment="post-${action.id}">
			        <b>${action.post.content}</b>
		        </g:link>
		    </g:if>
		    <g:else>
		   		<g:link class="link" controller="Question" action="display" id="${action.post.id}" fragment="post-${action.id}">
			        <b>${action.post.content}</b>
		        </g:link>
		    </g:else>
		</div>
	</g:elseif>
	
	<g:elseif test="${action.type == PostType.VOTE_DOWN}">
		<div style="float:left;width:100px;margin-right:10px;">
			<prettytime:display date="${action.date}"></prettytime:display>
		</div>
		<div style="float:left;margin-left:10px;width:100px;text-align: center" ><g:message code="user.profile.activity.vote.down"/></div>
		<div style="float:left;margin-left:10px;">		
			<g:if test="${Answer.class.is(action.post.class)}">
		        <g:link class="link" controller="Question" action="display" id="${action.post.question.id}" fragment="post-${action.id}">
			        <b>${action.post.content}</b>
		        </g:link>
		    </g:if>
		    <g:else>
		   		<g:link class="link" controller="Question" action="display" id="${action.post.id}" fragment="post-${action.id}">
			        <b>${action.post.content}</b>
		        </g:link>
		    </g:else>
		</div>
	</g:elseif>
	
	<div style="clear : both;"></div>
	<hr id="contributorPostSeparator"/>
</div>
