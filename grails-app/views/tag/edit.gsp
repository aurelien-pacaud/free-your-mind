<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Free your mind -- Add tag</title>		
  </head>
  <body>

    <h2><g:message code="tag.update.title" /> <g:render template="tagTemplate" var="tag" bean="${tag}" /> </h2>

    <g:form controller="tag" action="update" id="${tag.id}">
      <g:render template="form" var="tag" bean="${tag}" />
      <g:submitButton name="sumbit" value="${message(code: 'tag.update.button')}" class="btn ${tag?.hasErrors() ? 'btn-danger' : 'btn-primary'} pull-right formButton"/>
    </g:form>
  
  </body>
</html>
