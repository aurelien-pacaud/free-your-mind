<script type="text/javascript">
		function afficher(tabId) {
			$('#myTab a[href="#'+tabId+'"]').tab('show')
		}
</script>

<div class="contributoItemPost">
	<div class="summaryItem">
		<div class="summarySubDiv">
			<h3 style="" class="summaryHeader">${questions.size()} <g:message code="user.profile.tab.questions"/></h3>
			<br/>
			<g:render template="questionItemListTemplate" var="question" collection="${sumQuestions}" />
		</div>
		<a href="#" onclick="afficher('questions')"><g:message code="user.profile.view.more"/></a>
	</div>
	<div class="summaryItem">
		<div class="summarySubDiv">
			<h3 class="summaryHeader">${answers?.size()} <g:message code="user.profile.tab.answers"/></h3>
			<br/>
			<g:render template="answerItemListTemplate" var="post" collection="${sumAnswers}" />
		</div>
		<a href="#" onclick="afficher('answers')"><g:message code="user.profile.view.more"/></a>
	</div>
	<div class="summarySpacer"></div>
	<div class="summaryItem">
		<div class="summarySubDiv">
			<h3 class="summaryHeader">${comments.size()} <g:message code="user.profile.tab.comments"/></h3>
			<br/>
			<g:render template="commentItemListTemplate" var="comment" collection="${sumComments}" />
		</div>
		<a href="#" onclick="afficher('comments')"><g:message code="user.profile.view.more"/></a>
	</div>
	<div class="summaryItem">
		<div class="summarySubDiv">
			<h3 class="summaryHeader">${tags.size()} <g:message code="user.profile.tab.tags"/></h3>
			<br/>
			<g:render template="tagItemListTemplate" var="tag" collection="${sumTags}"/>
		</div>
		<a href="#" onclick="afficher('tag')"><g:message code="user.profile.view.more"/></a>
	</div>
	<div class="summarySpacer"></div>
</div>


