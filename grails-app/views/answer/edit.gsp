<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Free your mind -- Edit Answer</title>		
  </head>
  <body>

    <h2><g:message code="global.question" args="[0]" /></h2>
    <div class="postContent">
      <markdown:renderHtml>${answer.question.content}</markdown:renderHtml>
    </div>
   
    <hr />

    <h2><g:message code="answer.form.title" /></h2>
    <g:form controller="answer" action="update" id="${answer.id}">
      <g:render template="formAnswer" var="answer" bean="${answer}" />
      <g:submitButton name="sumbit" value="${message(code:'answer.form.button')}" class="btn ${answer?.hasErrors() ? 'btn-danger' : 'btn-primary'} pull-right formButton"/>
    </g:form>
    <jq:jquery>
      $("body").on('click', '.comment', function(e) {
  
        var element = "#comment-" + $(this).attr("id");
        console.log(element);
      
        if ($(element).is(":visible")) {
          $(element).hide();
        }
        else {
          $(element + " textarea").val('');
          $(element).show(); 
        }
      });
    </jq:jquery>

  </body>
</html>
