<%@page import="fr.isima.PostType"%>
<div class="contributoItemPost">
	<g:if test="${action.type ==  PostType.ASKED}" >
		<div style="float:left;">
			<prettytime:display date="${action.date}"></prettytime:display>
		</div>
		<div style="float:left;margin-left:10px;">Asked</div>
		<div style="float:left;">${action.post.title}</div>
	</g:if>
	<g:elseif test="${action.type == PostType.ANSWERED}">
		<div style="float:left;">
			<prettytime:display date="${action.date}"></prettytime:display>
		</div>
		<div style="float:left;margin-left:10px;">Answered</div>
		<div style="float:left;">${action.post.content}</div>
	</g:elseif>
	<g:elseif test="${action.type == PostType.REVISION}">
		<div style="float:left;">
			<prettytime:display date="${action.date}"></prettytime:display>
		</div>
		<div style="float:left;margin-left:10px;">Revised</div>
		<div style="float:left;">${action.post}</div>
	</g:elseif>
	<g:elseif test="${action.type == PostType.ACCEPTED}">
		<div style="float:left;">
			<prettytime:display date="${action.date}"></prettytime:display>
		</div>
		<div style="float:left;margin-left:10px;">Accepted</div>
		<div style="float:left;">${action.post}</div>
	</g:elseif>
	<g:elseif test="${action.type == PostType.COMMENTED}">
		<div style="float:left;">
			<prettytime:display date="${action.date}"></prettytime:display>
		</div>
		<div style="float:left;margin-left:10px;">Commented</div>
		<div style="float:left;">${action.post}</div>
	</g:elseif>
	<g:elseif test="${action.type == PostType.VOTE_UP}">
		<div style="float:left;">
			<prettytime:display date="${action.date}"></prettytime:display>
		</div>
		<div style="float:left;margin-left:10px;">Up voted</div>
		<div style="float:left;"></div>
	</g:elseif>
	<g:elseif test="${action.type == PostType.VOTE_DOWN}">
		<div style="float:left;">
			<prettytime:display date="${action.date}"></prettytime:display>
		</div>
		<div style="float:left;margin-left:10px;">Down Voted</div>
		<div style="float:left;"></div>
	</g:elseif>
	<div style="clear : both;"></div>
	<hr id="contributorPostSeparator"/>
</div>
