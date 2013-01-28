<style type="text/css" media="screen">
.label, .badge {
display: inline-block;
padding: 2px 4px;
font-size: 11.844px;
font-weight: bold;
line-height: 14px;
color: #ffffff;
text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
white-space: nowrap;
vertical-align: baseline;
background-color: #999999;
}

.label-info, .badge-info {
background-color: #3a87ad;
}

.label-success, .badge-success {
background-color: #468847;
}

.label-important, .badge-important {
background-color: #b94a48;
}

.label-warning, .badge-warning {
background-color: #f89406;
}

.itemPost {
	margin :3px;
}

hr {
	background-color: black;
	height: 1px;
	border: 0;
}
</style>

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
			<g:link controller="Contributor" action="show" id="${post.contributor.id}">${post.contributor.login}</g:link>		
		</div>		
	</div>
	
	<div style="clear : both;"></div>
	<hr />
</div>