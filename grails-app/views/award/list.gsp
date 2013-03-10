<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind -- User Profil</title>		
	</head>
	<body>	
		<h2><g:message code="global.award" args="[awards.size()]"/>
			<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
		        <span class="pull-right">
		          <g:link action="create" controller="award">
		            <img src="${fam.icon(name: 'add')}" alt="Add an Award"/>
		          </g:link>
		        </span>
	        </sec:ifAnyGranted>
	     </h2>	
		<g:render template="awardListItemTemplate" var="award" collection="${awards}" />
	    <div class="pagination">
			<g:paginate controller="award" action="list" total="${awardsCount}" max="15" offset="0" omitPrev="true" omitNext="true" />
		</div>
	</body>
</html>
