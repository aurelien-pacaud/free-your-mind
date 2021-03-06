<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Free your mind -- Edit comment</title>		
  </head>
  <body>

    <h2><g:message code="global.answer" args="[0]" /></h2>
    <div class="postContent">
      <markdown:renderHtml>${post.content}</markdown:renderHtml>
       
      <hr />
      <g:each in="${post.comments}">
        <g:if test="${it.id != comment.id}">
          
          <p class="commentPost">
            ${it.content} &ndash;
            <g:link action="show" controller="contributor" id="${it.contributor.id}">${comment.contributor.username}</g:link>
            <g:stackDate class="commentDate" date="${it.creationDate}" />
          </p>
        </g:if>
        <g:else>
          <div class="commentPost">
            <h2><g:message code="comment.update.title" /></h2>
            <g:form controller="comment" action="update" id="${comment.id}">
              <g:render template="/answer/formAnswer" var="answer" bean="${comment}" />
              <g:submitButton name="sumbit" value="${message(code: 'comment.update.button')}" class="btn ${comment?.hasErrors() ? 'btn-danger' : 'btn-primary'} pull-right formButton"/>
              <br />
            </g:form>
          </div>
        </g:else>
      </g:each>
    </div>
   
  </body>
</html>
