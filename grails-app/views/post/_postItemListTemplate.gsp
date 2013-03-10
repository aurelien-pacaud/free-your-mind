<div class="itemPost">
	
	<div style="float : left; text-align : center; margin-right : 5px;">${post.mark}<br /><g:message code="global.vote" args="[post.mark]"/></div>	
	<div style="float : left; text-align : center; margin-right : 5px;">${post.answers.size()}<br /><g:message code="global.answer" args="[post.answers.size()]"/></div>
	<div style="float : left; text-align : center; margin-right : 5px;">${post.nbView}<br /><g:message code="global.view" args="[post.nbView]"/></div>	
	
	<div>		
		<g:if test="${post.isClosed}">
			<div class="label label-important"><g:message code="global.closed" /></div>
		</g:if>
		<g:link controller="Question" action="display" id="${post.id}">
                  <g:if test="${post.isAccepted}">
                    <span class="label-success label"><g:message code="global.accepeted" /></span>
                  </g:if>
                  <b>${post.title}</b>
                </g:link>
	
		<div style="float:right">						
			<g:render template="/tag/tagTemplate" var="tag" collection="${post.tags}" />		
		</div>		
		<br />
		<div style="float:right">					
			<prettytime:display date="${post.creationDate}" /> <g:message code="user.post.by" /> <g:link controller="Contributor" action="show" id="${post.contributor.id}">${post.contributor.username}</g:link>		
		</div>		
	</div>
	
	<div style="clear : both;"></div>
	<hr />
</div>
