<%@page import="fr.isima.PostType"%>
<%@page import="fr.isima.Answer"%>
<div class="contributoItemPost">
  <g:if test="${action.type ==  PostType.ASKED}">
  <div class="activityType">
    <prettytime:display date="${action.date}"></prettytime:display>
  </div>
  <div class="activityType">  
    <g:message code="user.profile.activity.asked"/>
  </div>
  <div style="float:left;margin-left:10px;">		
    <g:link class="link" controller="Question" action="display" id="${action.post.id}">
    <b>${action.post.title}</b>
    </g:link>	
  </div>
  </g:if>

  <g:elseif test="${action.type == PostType.ANSWERED}">
  <div class="activityType">
    <prettytime:display date="${action.date}"></prettytime:display>
  </div>
  <div class="activityType"><g:message code="user.profile.activity.answered"/></div>
  <div style="float:left;margin-left:10px;">		
    <g:link class="link" controller="Question" action="display" id="${action.post.question.id}" fragment="post-${action.post.id}">
    <b>${action.post.question.title}</b>
    </g:link>	
  </div>
  </g:elseif>

  <g:elseif test="${action.type == PostType.REVISION}">
  <div class="activityType">
    <prettytime:display date="${action.date}"></prettytime:display>
  </div>
  <div class="activityType"><g:message code="user.profile.activity.revised"/></div>
  <div style="float:left;margin-left:10px;">		
    <g:if test="${Answer.class.is(action.post.class)}">
    <g:link class="link" controller="Question" action="display" id="${action.post.question.id}" fragment="post-${action.post.id}">
    <b>${action.post.question.title}</b>
    </g:link>
    </g:if>
    <g:else>
    <g:link class="link" controller="Question" action="display" id="${action.post.question.id}" fragment="post-${action.post.id}">
    <b>${action.post.question.title}</b>
    </g:link>
    </g:else>
  </div>
  </g:elseif>

  <g:elseif test="${action.type == PostType.ACCEPTED}">
  <div class="activityType">
    <prettytime:display date="${action.date}"></prettytime:display>
  </div>
  <div class="activityType success"><b><g:message code="user.profile.activity.accepted"/></b></div>
  <div style="float:left;margin-left:10px;">		
    <g:if test="${Answer.class.is(action.post.class)}">
    <g:link class="link" controller="Question" action="display" id="${action.post.question.id}" fragment="post-${action.post.id}">
    <b>${action.post.question.title}</b>
    </g:link>
    </g:if>
    <g:else>
    <g:link class="link" controller="Question" action="display" id="${action.post.id}" fragment="post-${action.post.id}">
    <b>${action.post.title}</b>
    </g:link>
    </g:else>
  </div>
  </g:elseif>

  <g:elseif test="${action.type == PostType.COMMENTED}">
  <div class="activityType">
    <prettytime:display date="${action.date}"></prettytime:display>
  </div>
  <div class="activityType"><g:message code="user.profile.activity.commented"/></div>
  <div style="float:left;margin-left:10px;">		
    <g:if test="${Answer.class.is(action.post.post.class)}">
    <g:link class="link" controller="Question" action="display" id="${action.post.post.question.id}" fragment="post-${action.post.id}">
    <b>${action.post.question.title}</b>
    </g:link>
    </g:if>
    <g:else>
    <g:link class="link" controller="Question" action="display" id="${action.post.post.id}" fragment="post-${action.post.id}">
    <b>${action.post.post.title}</b>
    </g:link>
    </g:else>
  </div>
  </g:elseif>

  <g:elseif test="${action.type == PostType.VOTE_UP}">
  <div class="activityType">
    <prettytime:display date="${action.date}"></prettytime:display>
  </div>
  <div class="activityType"><g:message code="user.profile.activity.vote.up"/></div>
  <div style="float:left;margin-left:10px;">		
    <g:if test="${Answer.class.is(action.post.class)}">
    <g:link class="link" controller="Question" action="display" id="${action.post.question.id}" fragment="post-${action.post.id}">
    <b>${action.post.question.title}</b>
    </g:link>
    </g:if>
    <g:else>
    <g:link class="link" controller="Question" action="display" id="${action.post.id}" fragment="post-${action.post.id}">
    <b>${action.post.title}</b>
    </g:link>
    </g:else>
  </div>
  </g:elseif>

  <g:elseif test="${action.type == PostType.VOTE_DOWN}">
  <div class="activityType">
    <prettytime:display date="${action.date}"></prettytime:display>
  </div>
  <div class="activityType"><g:message code="user.profile.activity.vote.down"/></div>
  <div style="float:left;margin-left:10px;">		
    <g:if test="${Answer.class.is(action.post.class)}">
    <g:link class="link" controller="Question" action="display" id="${action.post.question.id}" fragment="post-${action.post.id}">
    <b>${action.post.question.title}</b>
    </g:link>
    </g:if>
    <g:else>
    <g:link class="link" controller="Question" action="display" id="${action.post.id}" fragment="post-${action.post.id}">
    <b>${action.post.question.title}</b>
    </g:link>
    </g:else>
  </div>
  </g:elseif>

  <g:elseif test="${action.type == PostType.REPUTATION}">
  <div class="activityType">
    <prettytime:display date="${action.date}"></prettytime:display>
  </div>
  <div class="activityType"><g:message code="user.profile.activity.reputation"/></div>
  <div style="float:left;margin-left:10px;">		
    <b class="${action.reputation >= 0 ? 'success' : 'error'}">${action.reputation}</b>
  </div>
  </g:elseif>
  <g:elseif test="${action.type == PostType.AWARD}">
  <div class="activityType">
    <prettytime:display date="${action.date}"></prettytime:display>
  </div>
  <div class="activityType"><g:message code="user.profile.activity.award"/></div>
  <div style="float:left;margin-left:10px;">		
    <g:render template="/award/awardTemplate" bean="${action.award}" var="award" />
  </div>
  </g:elseif>



  <div style="clear : both;"></div>
  <hr id="contributorPostSeparator"/>
</div>
