<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Free your mind -- Ask Question</title>		
  </head>
  <body>
    <h2><g:message code="question.creation.title"/></h2>

    <g:form controller="question" action="save">
      <g:render template="formQuestion" var="question" bean="${question}" />
      <g:submitButton name="sumbit" value="${message(code:'question.creation.button')}" class="btn ${question?.hasErrors() ? 'btn-danger' : 'btn-primary'} pull-right formButton" />
    </g:form>
    
    <g:javascript src="tags.js" />
    <jq:jquery>
      $(function() {
        $('#tags').tagAutocomplete({"source" : ${tags}.tags, "selectedTags" : ${tagIds == null ? [] : tagIds}});
      });
    </jq:jquery>
  </body>
</html>
