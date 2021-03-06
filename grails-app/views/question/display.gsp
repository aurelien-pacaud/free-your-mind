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
          <span class="label label-important"><g:message code="global.closed" /></span>
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
    <div id="answersTitle" class="${!answers.isEmpty() ? '' : 'hide'}" >
      <h2 id="answerTitleNumber">${question.answers.size()} <g:message code="global.answer" args="[question.answers.size()]" /></h2>
      <ul class="nav nav-tabs" id="answersSelect">
        <li class="${params.sort == 'latest' || params.sort == null ? 'active' : ''}">
          <g:link controller="question" action="display" id="${question.id}" params="[sort: 'latest']"><g:message code="question.choice.oldest" /></g:link>
        </li>
        <li class="${params.sort == 'vote' ? 'active' : ''}">
          <g:link controller="question" action="display" id="${question.id}" params="[sort: 'vote']"><g:message code="question.choice.vote" /></g:link>
        </li>
      </ul>
    </div>
    
    <!-- Contain all answer -->
    <div id="answers" class="tab-content">
      <div class="pagination pull-right">
        <g:paginate controller="question" action="display" total="${answersCount}" params="[sort: 'latest']" max="4" offset="0" omitPrev="true" omitNext="true" id="${question.id}"/>
      </div>
      <div class="clear"></div>

      <g:render template="/post/postTemplate" var="post" collection="${answers}" />
    </div>
 
    <sec:ifLoggedIn>
      <g:if test="${!question.isClosed}">
        <h2><g:message code="question.form.answer.title" /></h2>
   
          <!-- Add form to reply to this question. -->
          <g:form name="answerForm" controller="question" action="saveAnswer">
            <div id="answerFormDiv" class="${replyError != null && replyError == true ? 'alert-error' : ''}">
              <g:if test="${replyError != null && replyError == true}">
                <span><g:message code="default.blank.message" /></span>
              </g:if>
              <g:render template="/answer/formAnswer" var="answer" bean="${answer}" />
              <g:hiddenField name="idQ" value="${question.id}" />
            </div>
          <g:submitButton name="submit" value="${message(code: 'question.form.answer.button')}" class="btn btn-primary pull-right formButton ${replyError != null && replyError == true ? 'btn-danger' : ''}" />
        </g:form>
      </g:if>
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
    </jq:jquery>
  </body>
</html>
