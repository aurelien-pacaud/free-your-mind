<div class="${hasErrors(bean:answer, field: 'content', 'alert-error')}">
  <g:renderErrors class="alert-error" bean="${answer}" field="content" />
  <g:textArea class="${hasErrors(bean:answer, field: 'content', 'error')} postContent" name="content" id="answerContent" value="${answer?.content}"/>
</div>
