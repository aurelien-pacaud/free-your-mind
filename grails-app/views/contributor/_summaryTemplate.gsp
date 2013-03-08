<script type="text/javascript">
		function afficher(tabId) {
			$('#myTab a[href="#'+tabId+'"]').tab('show')
		}
</script>
<div>
	<div class="summaryItem">
		<div class="summarySubDiv">
			<h3>${questions.size()} <g:message code="user.profile.tab.questions"/></h3>
			<g:render template="questionItemListTemplate" var="question" collection="${sumQuestions}" />
		</div>
		<a href="#" onclick="afficher('questions')"><g:message code="user.profile.view.more"/></a>
	</div>
	<div class="summaryItem">
		<div class="summarySubDiv">
			<h3>${answers?.size()} <g:message code="user.profile.tab.answers"/></h3>
			<g:render template="answerItemListTemplate" var="post" collection="${sumAnswers}" />
		</div>
		<a href="#" onclick="afficher('answers')"><g:message code="user.profile.view.more"/></a>
	</div>
	<div class="summarySpacer"></div>
	<div class="summaryItem">
		<div class="summarySubDiv">
			<h3>${comments.size()} <g:message code="user.profile.tab.comments"/></h3>
			<g:render template="commentItemListTemplate" var="comment" collection="${sumComments}" />
		</div>
		<a href="#" onclick="afficher('comments')"><g:message code="user.profile.view.more"/></a>
	</div>
	<div class="summaryItem">
		<div class="summarySubDiv">
			<h3>${tags.size()} <g:message code="user.profile.tab.tags"/></h3>
			<g:render template="tagItemListTemplate" var="tag" collection="${sumTags}"/>
		</div>
		<a href="#" onclick="afficher('tag')"><g:message code="user.profile.view.more"/></a>
	</div>
	<div class="summarySpacer"></div>
</div>

