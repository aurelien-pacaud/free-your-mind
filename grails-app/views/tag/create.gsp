<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Free your mind -- Add tag</title>		
  </head>
  <body>

    <h2>Add a new tag</h2>

    <g:form controller="tag" action="save">
      <label for="title">Name</label>
      <div class="${hasErrors(bean: tag, field: 'name', 'alert-error')}">
        <g:renderErrors class="alert-error" bean="${tag}" field="name" />
        <g:textField class="${hasErrors(bean: tag, field: 'name', 'error')} postContent" name="name" id="tagName" value="${tag?.name}"/>
      </div>
      <g:render template="form" var="tag" bean="${tag}" />
      <g:submitButton name="submit" value="Add the tag" class="btn ${tag?.hasErrors() ? 'btn-danger' : 'btn-primary'} pull-right formButton"/>
    </g:form>
  
  </body>
</html>
