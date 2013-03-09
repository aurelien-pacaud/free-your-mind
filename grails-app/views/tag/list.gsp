<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Free your mind</title>		
  </head>
  <body>
    
    <h2><g:message code="global.tags"/> (${tags.size()})
      <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
        <span class="pull-right">
          <g:link action="create" controller="tag">
            <img src="${fam.icon(name: 'add')}" alt="Add a tag"/>
          </g:link>
        </span>
      </sec:ifAnyGranted>
    </h2>

    <g:render template="/tag/tagDetailsTemplate" var="tag" collection="${tags}" />		
    <div style="clear : both;"></div>
  </body>
</html>
