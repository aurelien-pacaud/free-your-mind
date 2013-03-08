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
      <g:paginate controller="question" action="list" total="${questionsCount}" max="3" offset="0" omitPrev="true" omitNext="true"/>
    </div>
    <div class="pagination pull-right">
      <g:link controller="question" action="list" params="[max: '4', offset: 0]" class="${displayItem == 15 ? 'currentStep' : ''}">15</g:link>
      <g:link controller="question" action="list" params="[max: '6', offset: 0]" class="${displayItem == 15 ? 'currentStep' : ''}">30</g:link>
      <a href="?displayItem=50" class="${displayItem == 50 ? 'currentStep' : ''}">50</a>
    </div>

  </body>
</html>
