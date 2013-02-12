<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Free your mind -- Edit Answer</title>		
  </head>
  <body>
    <h2>Edit answer</h2>

    <g:form controller="answer" action="save" id="${answer.id}">
      <g:render template="formAnswer" var="answer" bean="${answer}" />
      <g:submitButton name="sumbit" value="Edit"/>
    </g:form>

  </body>
</html>
