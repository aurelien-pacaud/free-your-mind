<%@page import="fr.isima.AwardType" %>
<%@page import="fr.isima.AwardCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind -- User Profil</title>		
	</head>
	<body>	
		<h2><g:message code="award.creation.title"/></h2>	
		
		<script type="text/javascript">
		 function hideDivs() {
			      	if(document.getElementById("type")[document.getElementById("type").selectedIndex].value  == "REPUTATION") {
					  		$('#tagInput').hide()
					  } else {
					  		$('#tagInput').show()
					  }			      	
			      }
		</script>
		<g:form action="createAward" controller="award">
				<label><g:message code="award.form.type"/></label>
				<div class='${hasErrors(bean:award,field:'type','alert-error')}'>
					<g:renderErrors bean="${award}" field="type"/>
			  		<g:select name="type" value="${award?.type}" from="${AwardType}" onChange="hideDivs()"/>
			  	</div>
			  	<label><g:message code="award.form.category"/></label>
			  	<div class='${hasErrors(bean:award,field:'category','alert-error')}'>
					<g:renderErrors bean="${award}" field="category"/>
			  		<g:select name="category" value="${award?.category}" from="${AwardCategory}"/>
			  	</div>
			  	<label><g:message code="award.form.title"/></label>
			  	<div class='${hasErrors(bean:award,field:'title','alert-error')}'>
			  		<g:renderErrors bean="${award}" field="title"/>
			  		<g:textField name="title" id="loginUser" type="text" value="${award?.title}" />
			  	</div>
				<div id="bound" >
				  	<label><g:message code="award.form.bound"/></label>
				  	<div class='${hasErrors(bean:award,field:'bound','alert-error')}'>
				  		<g:renderErrors bean="${award}" field="bound" />
				  		<g:if test="${award != null}" ><g:field type="number" name="bound" value="${award?.bound}"/></g:if>
				  		<g:else><g:field type="number" min="0" name="bound" value="0"/></g:else>
				  		
				  	</div>
				</div>
                <div id="tagInput">
  			  		<label for="tags"><g:message code="global.tag" args=[2]/></label>
                    <div class="${hasErrors(bean:question, field: 'tags', 'alert-error')}">		
                       <g:renderErrors bean="${question}" field="tags" />		
                       <div id="tags" class="${hasErrors(bean:question, field: 'tags', 'error')} uneditable-input">
                         <g:textField id="tag" type="text" name="tags"/>
                       </div>
                    </div>
                    <g:hiddenField id="tagsId" type="hidden" name="tagsId" value=""/>	
	  		    </div>
	           	<g:submitButton name="submit" type="submit" value="${message(code: 'award.form.submit')}" class="btn ${user?.hasErrors() ? 'btn-danger' : 'btn-primary'} formButton"/>
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
