<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Free your mind -- Questions list</title>		
  </head>
  <body>
    <h2>Questions (${questionsCount})</h2>
    <g:render template="/post/postItemListTemplate" var="post" collection="${questions}" />
    <div class="pagination">
      <g:paginate controller="question" action="list" total="${questionsCount}" max="4" offset="0" omitPrev="true" omitNext="true"/>
    </div>
    <div class="pagination pull-right">
      <g:each in="${[4, 6, 8]}">
        <g:if test="${params.max == it && questionsCount >= it}">
          <span class="currentStep">${params.max}</span>
        </g:if>
        <g:else>
          <g:if test="${questionsCount >= it}">
            <g:link controller="question" action="list" params="[max: it, offset: 0]">${it}</g:link>
          </g:if>
        </g:else>
      </g:each>
    </div>

  </body>
</html>
