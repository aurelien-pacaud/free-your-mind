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
          $("#answersTitle").removeClass('hide');
  
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

    <h2>${question.title} <span class="tags"><g:render template="/tag/tagTemplate" var="tag" collection="${question.tags}" /></span>
      <g:if test="${!question.isClosed}">
        <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
          <span style="float: right;">
            <g:link action="lock" controller="question" title="Lock the question" id="${question.id}">
              <img src="${fam.icon(name: 'lock')}" alt="Lock the question"/>
            </g:link>
          </span>
        </sec:ifAnyGranted>
      </g:if>
      <g:else>
        <div style="float: right;">
          <span class="label label-important">Closed</span>
          <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
            <span>
              <g:link action="unlock" controller="question" title="Unlock the question" id="${question.id}">
                <img src="${fam.icon(name: 'lock_open')}" alt="Unlock the question"/>
              </g:link>
            </span>
          </sec:ifAnyGranted>
        </div>
      </g:else>
    </h2>
    
    <g:render template="/post/postTemplate" var="post" collection="${question}" />
    <br />

    <div id="answersTitle" class="${!question.answers.isEmpty() ? '' : 'hide'}" >
      <h2 id="answerTitleNumber">${question.answers.size()} Answers</h2>
      <ul class="nav nav-tabs" id="answersSelect">
        <li class="active"><g:remoteLink action="latestAnswers" id="${question.id}" update="answers" onSuccess="updateCodeColor()">Oldest</g:remoteLink></li>
        <li><g:remoteLink action="votedAnswers" id="${question.id}" update="answers" onSuccess="updateCodeColor()">Vote</g:remoteLink></li>
      </ul>
    </div>
     
    <div id="answers" class="tab-content">
      <g:render template="/post/postTemplate" var="post" collection="${question.answers}" />
    </div>
 
    <script>
      $('#answersSelect a[href="#latest"]').tab('show');
    </script>

    <br />
    <h2>Your Answer</h2>
    <br />
    <sec:ifNotLoggedIn>
      Please logging before answered! <g:link controller="login" action="auth">Login</g:link>
    </sec:ifNotLoggedIn>
    <sec:ifAllGranted roles="ROLE_USER">
      <g:if test="${!question.isClosed}">
        <g:formRemote name="answerForm" update="answers" url="[controller : 'answer', action: 'save', params: [idQ: question.id]]"
                      onSuccess="updateAnswers()">	
          <g:render template="/answer/formAnswer" var="answer" bean="${answer}" />
          <g:submitButton name="submitAnswer" value="Answered" id="submitA" class="btn btn-primary" />
        </g:formRemote>
      </g:if>
      <g:else>
        This question is lock! Bad luck Brian!!!!
      </g:else>
    </sec:ifAllGranted>
    <jq:jquery>
      $("body").on('click', '.comment', function(e) {
  
        var element = "#comment-" + $(this).attr("id");
      
        if ($(element).is(":visible")) {
          $(element).hide();
        }
        else {
          $(element + " textarea").val('');
          $(element).show(); 
        }
      });

      $('#answersSelect a').click(function() {
        $(this).parent().addClass("active"); 
        $(this).parent().siblings("li").removeClass("active"); 
      });

    </jq:jquery>
  </body>
</html>
