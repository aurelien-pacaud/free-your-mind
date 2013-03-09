<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind</title>		
	</head>
	<body>
		<div>
			<h2><g:message code="user.update.title"/></h2>
			<g:form action="updateUser" controller="contributor">
			  	<label><g:message code="user.form.first.name"/></label>
			  	<div class="${hasErrors(bean:user,field:'firstName','eralert-errorror')}">
			  		<g:renderErrors bean="${user}" field="firstName"/>
			  		<g:textField name="firstName" type="text" value="${user?.firstName}" />
			  	</div>
			  	<label><g:message code="user.form.last.name"/></label>
			  	<div  class="${hasErrors(bean:user,field:'lastName','alert-error')}">
			  		<g:renderErrors bean="${user}" field="lastName"/>
			  		<g:textField name="lastName" type="lastName" value="${user?.lastName}"/>
			  	</div>
			  	<label><g:message code="user.form.password"/></label>
			  	<div class="${hasErrors(bean:user,field:'password','alert-error')}">
			  		<g:renderErrors bean="${user}" field="password"/>
			  		<g:passwordField name="password" value="${user?.password}" />
			  	</div>
			  	<label><g:message code="user.form.email"/></label>
			  	<div class="${hasErrors(bean:user,field:'email','alert-error')}">
			  		<g:renderErrors bean="${user}" field="email"/>
			  		<g:textField name="email" type="email" value="${user?.email}" />
			  	</div>			  
			  	<label><g:message code="user.form.birth.date"/></label>
			  	<div  class="${hasErrors(bean:user,field:'birthDate','alert-error')}">
			  		<g:renderErrors bean="${user}" field="birthDate"/>
			  		<g:datePicker name="birthDate" precision="day" value="${user?.birthDate}"/>
			  	</div>
			  	<label><g:message code="user.form.location"/></label>
			  	<div class="${hasErrors(bean:user,field:'location','error')}">
			  		<g:renderErrors bean="${user}" field="location"/>
			  		<g:textField name="location" type="text" value="${user?.location}"/>
			  	</div>
			  	<g:hiddenField name="id" value="${user?.id}" />
			  	<g:submitButton name="submit" type="submit" value="Edit your profil" class="btn ${user?.hasErrors() ? 'btn-danger' : 'btn-primary'} formButton"/>
			</g:form>
		<br/>
	</body>
</html>
