<%@page import="fr.isima.AwardType" %>
<%@page import="fr.isima.AwardCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind -- User Profil</title>		
	</head>
	<body>	
		<h2>Awards</h2>	
		
		<script type="text/javascript">
		 function hideDivs() {
			      	if(document.getElementById("type")[document.getElementById("type").selectedIndex].value  == "REPUTATION") {
					  		$('#description').show()
					  		$('#tagInput').hide()
					  } else {
					 		$('#description').hide()
					  		$('#tagInput').show()
					  }			      	
			      }
		</script>
		<g:form action="updateAward" controller="award">
				<label><g:message code="award.creation.form.type"/></label>
				<div class='${hasErrors(bean:award,field:'type','alert-error')}'>
					<g:renderErrors bean="${award}" field="type"/>
			  		<g:select name="type" value="${award?.type}" from="${AwardType}" onChange="hideDivs()"/>
			  	</div>
			  	<label><g:message code="award.creation.form.category"/></label>
			  	<div class='${hasErrors(bean:award,field:'category','alert-error')}'>
					<g:renderErrors bean="${award}" field="category"/>
			  		<g:select name="category" value="${award?.category}" from="${AwardCategory}"/>
			  	</div>
			  	<label><g:message code="award.creation.form.title"/></label>
			  	<div class='${hasErrors(bean:award,field:'title','alert-error')}'>
			  		<g:renderErrors bean="${award}" field="title"/>
			  		<g:textField name="title" id="loginUser" type="text" value="${award?.title}" />
			  	</div>
				<div id="bound" >
				  	<label><g:message code="award.creation.form.bound"/></label>
				  	<div class='${hasErrors(bean:award,field:'bound','alert-error')}'>
				  		<g:renderErrors bean="${award}" field="bound" />
				  		<g:if test="${award != null}" ><g:field type="number" name="bound" value="${award?.bound}"/></g:if>
				  		<g:else><g:field type="number" min="0" name="bound" value="0"/></g:else>
				  		
				  	</div>
				</div>
	  		    <g:hiddenField id="awardId" type="hidden" name="awardId" value="${award?.id}"/>	
	            <g:submitButton name="submit" type="submit" value="Submit" />
			  	<g:javascript src="tags.js" />
			    <jq:jquery>
			     $(document).ready(function() {
					  hideDivs();
					});
				</jq:jquery>
				<script>
			      $(function() {
			        $('#tags').tagAutocomplete({"source" : ${tags}.tags, "selectedTags" : ${tagIds == null ? [] : tagIds}});
			      })
			    </script>
		</g:form>
		
		
	</body>
</html>
<html>
