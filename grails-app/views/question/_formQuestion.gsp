<label for="title"><g:message code="question.form.title" /></label>
<div class="${hasErrors(bean:question, field: 'title', 'alert-error')}">
  <g:renderErrors bean="${question}" field="title" />
  <g:textField class="${hasErrors(bean:question, field: 'title', 'error')}" name="title" id="title" value="${question?.title}"/>
</div>	

<label for="tags"><g:message code="question.form.tags" /></label>
<div class="${hasErrors(bean:question, field: 'tags', 'alert-error')}">		
  <g:renderErrors bean="${question}" field="tags" />		
    <div id="tags" class="uneditable-input">
      <g:textField id="tag" type="text" name="tags"/>
    </div>
</div>

<g:hiddenField id="tagsId" type="hidden" name="tagsId" value=""/>

<label for="content"><g:message code="question.form.content" /></label>
<div class="${hasErrors(bean:question, field: 'content', 'alert-error')}">
  <g:renderErrors class="alert-error" bean="${question}" field="content" />
  <g:textArea class="${hasErrors(bean:question, field: 'content', 'error')} postContent" name="content" id="questionContent" value="${question?.content}"/>
</div>
