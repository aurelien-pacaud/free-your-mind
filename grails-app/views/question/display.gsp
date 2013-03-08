<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Free your mind -- Ask Question</title>		
  </head>
  <body>
        
    <h2>
      
      ${question.title} 
      <span class="tags">
        <g:render template="/tag/tagTemplate" var="tag" collection="${question.tags}" />
      </span>

      <g:if test="${!question.isClosed}">
        <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
          <span class="pull-right">
            <g:link action="lock" controller="question" title="Lock the question" id="${question.id}">
              <img src="${fam.icon(name: 'lock')}" alt="Lock the question"/>
            </g:link>
          </span>
        </sec:ifAnyGranted>
      </g:if>
      <g:else>
        <div class="pull-right">
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
    
    <!-- Display the question with the postTemplate. -->
    <g:render template="/post/postTemplate" var="post" bean="${question}" />

    <!-- Tab to sort answer. -->
    <div id="answersTitle" class="${!question.answers.isEmpty() ? '' : 'hide'}" >
      <h2 id="answerTitleNumber">${question.answers.size()} Answers</h2>
      <ul class="nav nav-tabs" id="answersSelect">
        <li class="active">
          <g:remoteLink action="latestAnswers" id="${question.id}" update="answers" onSuccess="updateCodeColor()">Oldest</g:remoteLink>
        </li>
        <li>
          <g:remoteLink action="votedAnswers" id="${question.id}" update="answers" onSuccess="updateCodeColor()">Vote</g:remoteLink>
        </li>
      </ul>
    </div>
    
    <!-- Contain all answer -->
    <div id="answers" class="tab-content">
      <g:render template="/post/postTemplate" var="post" collection="${question.answers}" />
    </div>
 
    <h2>Your Answer</h2>
   
    <!-- If the visitor is not log -->
    <sec:ifNotLoggedIn>
      Please logging before answered! <g:link controller="login" action="auth">Login</g:link>
    </sec:ifNotLoggedIn>
    
    <!-- Add form to reply to this question. -->
    <sec:ifLoggedIn>
      <g:if test="${!question.isClosed}">
        <g:formRemote name="answerForm" update="answers" url="[controller : 'answer', action: 'save', params: [idQ: question.id]]"
                      onSuccess="updateAnswers(); removeFormError('#answerFormDiv');" 
                      onFailure="displayFormError('#answerFormDiv');">	
          <div id="answerFormDiv">
            <span></span>
            <g:render template="/answer/formAnswer" var="answer" bean="${answer}" />
          </div>
          <g:submitButton name="submit" value="Answer" class="btn btn-primary pull-right formButton" />
        </g:formRemote>
      </g:if>
      <g:else>
        This question is lock! Bad luck Brian!!!!
      </g:else>
    </sec:ifLoggedIn>    
    
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
    <script>
      var nbAnswers = ${question.answers.size()};

      function updateCodeColor() {
        $('pre code').each(function(i, e) {hljs.highlightBlock(e)});
      }

      /* Use to update nb of question. */
      function updateAnswers() {

        $('textarea#answerContent').val('');

        if (nbAnswers == 0)
          $("#answersTitle").removeClass('hide');
  
        $('h2#answerTitleNumber').html(++nbAnswers + " Answers");
        
        updateCodeColor();
      }

      $('#answersSelect a[href="#latest"]').tab('show');
    </script>

  </body>
</html>
