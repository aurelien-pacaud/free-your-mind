<div class="itemPost">
	
	<div style="float : left; text-align : center; margin-right : 5px;">${post.mark}<br /><g:message code="global.votes"/></div>	
	<div style="float : left; text-align : center; margin-right : 5px;">${post.answers.size()}<br /><g:message code="global.answers"/></div>
	<div style="float : left; text-align : center; margin-right : 5px;">${post.nbView}<br /><g:message code="global.views"/></div>	
	
	<div>		
		<g:if test="${post.isClosed}">
			<div class="label label-important">Closed</div>
		</g:if>
		<g:link controller="Question" action="display" id="${post.id}">
                  <g:if test="${post.isAccepted}">
                    <span class="label-success label" >Accepted</span>
                  </g:if>
                  <b>${post.title}</b>
                </g:link>
	
		<div style="float:right">						
			<g:render template="/tag/tagTemplate" var="tag" collection="${post.tags}" />		
		</div>		
		<br />
		<div style="float:right">					
			<prettytime:display date="${post.creationDate}" /> by <g:link controller="Contributor" action="show" id="${post.contributor.id}">${post.contributor.username}</g:link>		
		</div>		
	</div>
	
	<div style="clear : both;"></div>
	<hr />
</div>
