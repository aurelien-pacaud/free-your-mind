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
      <g:paginate controller="question" action="list" total="${questionsCount}" max="3" offset="0" />
    </diV>
  </body>
</html>
