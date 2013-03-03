<script type="text/javascript">
		function afficher(tabId) {
			$('#myTab a[href="#'+tabId+'"]').tab('show')
		}
</script>

<div class="contributoItemPost">
	<div class="summaryItem">
		<div class="summarySubDiv">
			<g:render template="questionListTemplate" />
		</div>
		<a href="#" onclick="afficher('questions')">View more</a>
	</div>
	<div class="summaryItem">
		<div class="summarySubDiv">
			<g:render template="answerListTemplate" />
		</div>
		<a href="#" onclick="afficher('answers')">View more</a>
	</div>
	<div class="summarySpacer"></div>
	<div class="summaryItem">
		<div class="summarySubDiv">
			<g:render template="commentListTemplate"/>
		</div>
		<a href="#" onclick="afficher('comments')">View more</a>
	</div>
	<div class="summaryItem">
		<div class="summarySubDiv">
			<g:render template="tagListTemplate"/>
		</div>
		<a href="#" onclick="afficher('tag')">View more</a>
	</div>
	<div class="summarySpacer"></div>
</div>


