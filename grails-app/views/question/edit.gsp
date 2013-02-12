<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Free your mind -- Ask Question</title>		
  </head>
  <body>
    <h2>Edit question</h2>

    <g:form controller="question" action="save" id="${question.id}">
      <g:render template="formQuestion" var="question" bean="${question}" />
      <g:submitButton name="sumbit" value="Edit"/>
    </g:form>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'tags.js')}"></script>
    <script>
      $(function() {
        $('#tags').tagAutocomplete({"source" : ${tags}.tags, "selectedTags" : ${tagIds == null ? [] : tagIds}});
      });
    </script>

  </body>
</html>
