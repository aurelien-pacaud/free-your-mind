<script type="text/javascript">
		function afficher(tabId) {
			$('#myTab a[href="#'+tabId+'"]').tab('show')
		}
</script>
<div>
	<div class="summaryItem">
		<div class="summarySubDiv">
			<h3><g:message code="global.question.numeroted" args="${[questions.size()]}"/></h3>
			<g:render template="questionItemListTemplate" var="question" collection="${sumQuestions}" />
		</div>
		<a href="#" onclick="afficher('questions')"><g:message code="global.view.more"/></a>
	</div>
	<div class="summaryItem">
		<div class="summarySubDiv">
			<h3><g:message code="global.answer.numeroted" args="${[answers.size()]}"/></h3>
			<g:render template="answerItemListTemplate" var="post" collection="${sumAnswers}" />
		</div>
		<a href="#" onclick="afficher('answers')"><g:message code="global.view.more"/></a>
	</div>
	<div class="summarySpacer"></div>
	<div class="summaryItem">
		<div class="summarySubDiv">
			<h3><g:message code="global.comment.numeroted" args="${[comments.size()] }"/></h3>
			<g:render template="commentItemListTemplate" var="comment" collection="${sumComments}" />
		</div>
		<a href="#" onclick="afficher('comments')"><g:message code="global.view.more"/></a>
	</div>
	<div class="summaryItem">
		<div class="summarySubDiv">
			<h3><g:message code="global.tag.numeroted" args="${[tags.size()] }"/></h3>
			<g:render template="tagItemListTemplate" var="tag" collection="${sumTags}"/>
		</div>
		<a href="#" onclick="afficher('tag')"><g:message code="global.view.more"/></a>
	</div>
	<div class="summarySpacer"></div>
</div>

