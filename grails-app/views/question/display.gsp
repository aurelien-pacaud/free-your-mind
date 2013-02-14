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
    <jq:jquery>
      $('#message').delay(4000).fadeOut();
    </jq:jquery>
    
    <g:if test="${flash.message}">
      <div id="message" class="alert alert-success">
        ${flash.message}
      </div>
    </g:if>

    <h2>${question.title} <g:render template="/tag/tagTemplate" var="tag" collection="${question.tags}" />
      <g:if test="${!question.isClosed}">
        <span style="float: right;">
          <g:link action="lock" controller="question" title="Lock the question" id="${question.id}">
            <img src="${fam.icon(name: 'lock')}" alt="Lock the question"/>
          </g:link>
        </span>
      </g:if>
      <g:else>
        <div style="float: right;">
          <span class="label label-important">Closed</span>
          <span>
            <g:link action="unlock" controller="question" title="Unlock the question" id="${question.id}">
              <img src="${fam.icon(name: 'lock_open')}" alt="Unlock the question"/>
            </g:link>
          </span>
        </div>
      </g:else>
    </h2>
    
    <g:render template="/post/postTemplate" var="post" collection="${question}" />
    <br />

    <g:if test="${!question.answers.isEmpty()}">
      <h2 id="answerTitleNumber">${question.answers.size()} Answers</h2>
    </g:if>
     
    <div id="answers">
      <g:render template="/post/postTemplate" var="post" collection="${question.answers}" />
    </div>

    <br />
    <h2>Your Answer</h2>
    <br />
    <sec:ifNotLoggedIn>
      Please logging before answered! <g:link controller="contributor" action="login">Login</g:link>
    </sec:ifNotLoggedIn>
    <sec:ifAllGranted roles="ROLE_USER">
      <g:if test="${!question.isClosed}">
        <g:formRemote name="answerForm" update="answers" url="[controller : 'answer', action: 'save', params: [idQ: question.id]]"
                      onSuccess="updateAnswers()">	
          <g:render template="/answer/formAnswer" var="answer" bean="${answer}" />
          <br />
          <g:submitButton name="submitAnswer" value="Answered" id="submitA" />
        </g:formRemote>
      </g:if>
      <g:else>
        This question is lock! Bad luck Brian!!!!
      </g:else>
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
