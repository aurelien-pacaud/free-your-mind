<div class="itemPost">
	
	<div style="float : left; text-align : center; margin-right : 5px;">${post.mark}<br />Vote</div>
	<div style="float : left; text-align : center; margin-right : 5px;">${post.nbView}<br />Views</div>
	
	<div>		
		<g:if test="${post.isClosed}">
			<div class="label label-important">Closed</div>
		</g:if>	
		<g:if test="${!post.isClosed}">
			<div class="label label-warning">New</div>
		</g:if>
		<g:link controller="Question" action="display" id="${post.id}">${post.title}</g:link>
	
		<div style="float:right">						
			<g:render template="/tag/tagTemplate" var="tag" collection="${post.tags}" />		
		</div>		
		<br />
		<div style="float:right">					
			by <g:link controller="Contributor" action="show" id="${post.contributor.id}">${post.contributor.login}</g:link>		
		</div>		
	</div>
	
	<div style="clear : both;"></div>
	<hr />
</div>