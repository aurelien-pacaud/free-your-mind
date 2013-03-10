<label for="title"><g:message code="tag.form.description" /></label>
<div class="${hasErrors(bean: tag, field: 'description', 'alert-error')}">
  <g:renderErrors class="alert-error" bean="${tag}" field="description" />
  <g:textArea class="${hasErrors(bean: tag, field: 'description', 'error')} postContent" name="description" id="tagDescription" value="${tag?.description}"/>
</div>
