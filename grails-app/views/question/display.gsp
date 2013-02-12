<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Free your mind -- Ask Question</title>		
  </head>
  <body>	
    <h2>${question.title} <g:render template="/tag/tagTemplate" var="tag" collection="${question.tags}" /></h2>	
    <g:render template="/post/postTemplate" var="post" collection="${question}" />
    <br />

    <g:if test="${!question.answers.isEmpty()}">
      <h2>${question.answers.size()} Answers</h2>
        <div id="answers">
          <g:render template="/post/postTemplate" var="post" collection="${question.answers}"/>
        </div>
    </g:if>
    <br />
    <h2>Your Answer</h2>
    <br />
    <sec:ifNotLoggedIn>
      Please logging before answered! <g:link controller="contributor" action="login">Login</g:link>
    </sec:ifNotLoggedIn>
    <sec:ifAllGranted roles="ROLE_USER">
      <g:formRemote name="answerForm" update="answers" url="[controller : 'answer', action: 'save', params: [idQ: question.id]]">	
        <g:render template="/answer/formAnswer" var="answer" bean="${answer}" />
        <br />
        <g:submitButton name="submitAnswer" value="Answered" id="submitA" style="float : right;"/>
      </g:formRemote>
    </sec:ifAllGranted>

    <script>
      $(".comment").click(function(e) {
    
        var element = "#comment-" + $(this).attr("id");
    
        if ($(element).is(":visible")) {
          $(element).hide();
        }
        else {
          $(element + " textarea").val('');
          $(element).show(); 
        }
      });
    </script>
  </body>
</html>
