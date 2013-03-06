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
					  		$('#description').hide()
					  		$('#tag').hide()
					  } else {
					 		$('#description').show()
					  		$('#tag').show()
					  }			      	
			      }
		</script>
		<g:form action="createAward" controller="award">
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
			  	<div id="description">
				  	<label><g:message code="award.creation.form.description"/></label>
				  	<div class="${hasErrors(bean:award,field:'description','alert-error')}" >
				  		<g:renderErrors bean="${award}" field="description"/>
					    <g:textArea name="description" value="${award?.description}"/>
					 </div>
				</div>
				<div id="tag" >
				  	<label><g:message code="award.creation.form.bound"/></label>
				  	<div class='${hasErrors(bean:award,field:'bound','alert-error')}'>
				  		<g:renderErrors bean="${award}" field="bound" />
				  		<g:textField name="bound" value="${award?.bound}"/>
				  	</div>
				 </div>
			  	<label><g:message code="award.creation.form.tag"/></label>
			  	<div class="${hasErrors(bean:award, field: 'tags', 'alert-error')}">		
				    <g:renderErrors bean="${question}" field="tags" />		
				    <div id="tags" class="${hasErrors(bean:question, field: 'tags', 'error')} uneditable-input">
				    	<g:textField id="tag" type="text" name="tags"/>
				 	</div>
				</div>
				<g:hiddenField id="tagsId" type="hidden" name="tagsId" value=""/>
			  	
			  	<g:submitButton name="submit" type="submit" value="Submit" />
			  	
			  	<g:javascript src="tags.js" />
			    <jq:jquery>
			     $(document).ready(function() {
					  hideDivs();
					});
			      $(function() {
			        $('#tags').tagAutocomplete({"source" : ${tags}.tags, "selectedTags" : ${tagIds == null ? [] : tagIds}});
			      })
			    </jq:jquery>
		</g:form>
		
		
	</body>
</html>
<html>