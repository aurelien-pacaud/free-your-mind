<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Free your mind -- Ask Question</title>		
  </head>
  <body>
    <h2><g:message code="question.update.title"/></h2>

    <g:form controller="question" action="update" id="${question.id}">
      <g:render template="formQuestion" var="question" bean="${question}" />
      <g:submitButton name="sumbit" value="${message(code: 'question.update.button')}" class="btn ${question.hasErrors() ? 'btn-danger' : 'btn-primary'} pull-right formButton"/>
    </g:form>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'tags.js')}"></script>
    <script>
      $(function() {
        $('#tags').tagAutocomplete({"source" : ${tags}.tags, "selectedTags" : ${tagIds == null ? [] : tagIds}});
      });
    </script>

  </body>
</html>
