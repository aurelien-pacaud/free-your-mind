<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Free your mind -- Ask Question</title>		
  </head>
  <body>
    <script>
      var nbAnswers = ${question.answers.size()};

      function updateCodeColor() {
        $('pre code').each(function(i, e) {hljs.highlightBlock(e)});
      }

      function updateAnswers() {

        $('textarea#answerContent').val('');

        if (nbAnswers == 0)
          $("<h2 id='answerTitleNumber'></h2>").insertBefore('#answers');
  
        $('h2#answerTitleNumber').html(++nbAnswers + " Answers");
        
        updateCodeColor();
      }
    </script>

    <h2>${question.title} <g:render template="/tag/tagTemplate" var="tag" collection="${question.tags}" />
      <span style="float: right;">
        <a title="Lock question" id="${question.id}">
          <img src="${fam.icon(name: 'lock')}" alt="Add a comment"/>
        </a>
      </span>
    </h2>
    
    <g:render template="/post/postTemplate" var="post" collection="${question}" />
    <br />

    <g:if test="${!question.answers.isEmpty()}">
      <h2 id="answerTitleNumber">${question.answers.size()} Answers</h2>
    </g:if>
     
    <div id="answers">
      <g:render template="/post/postTemplate" var="post" collection="${question.answers}"/>
    </div>

    <br />
    <h2>Your Answer</h2>
    <br />
    <sec:ifNotLoggedIn>
      Please logging before answered! <g:link controller="contributor" action="login">Login</g:link>
    </sec:ifNotLoggedIn>
    <sec:ifAllGranted roles="ROLE_USER">
      <g:formRemote name="answerForm" update="answers" url="[controller : 'answer', action: 'save', params: [idQ: question.id]]"
                    onSuccess="updateAnswers()">	
        <g:render template="/answer/formAnswer" var="answer" bean="${answer}" />
        <br />
        <g:submitButton name="submitAnswer" value="Answered" id="submitA" />
      </g:formRemote>
    </sec:ifAllGranted>
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
