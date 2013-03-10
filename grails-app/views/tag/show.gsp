<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Free your mind</title>		
  </head>
  <body>
    <div style="width : 28%; float : left;">
      <div>
        <h2><g:message code="global.tag" args="[0]"/> <g:render template="/tag/tagTemplate" var="tag" bean="${tag}" />
          <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
            
            <span class="pull-right">
              <span>
                <g:link action="edit" controller="tag" id="${tag.id}" title="Edit the tag">
                  <img src="${fam.icon(name: 'pencil')}" alt="Edit the tag"/>
                </g:link>
              </span>

              <g:if test="${tag.questions.isEmpty()}">
                <span>  
                  <g:link action="delete" controller="tag" id="${tag.id}" title="Delete this tag">
                    <img src="${fam.icon(name: 'cross')}" alt="Delete this tag"/>
                  </g:link>
                </span>
              </g:if>
            </span>

          </sec:ifAnyGranted>
        </h2>	
        <p>${tag.description}</p>			
      </div>
    </div>

    <div style="width : 70%; float : right;">
      <h2><g:message code="tag.relatedQuestion" args="[tag.questions.size()]"/></h2>
      <g:render template="/post/postItemListTemplate" var="post" collection="${tag.questions}" />
    </div>
    <div style="clear : both;"></div>
  </body>
</html>
