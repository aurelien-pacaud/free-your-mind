<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind</title>		
	</head>
	<body>
			<h2><g:message code="user.creation.title"/></h2>
			<g:form action="createUser" controller="contributor">
			  	<label><g:message code="user.form.login"/></label>
			  	<div class="${hasErrors(bean:user,field:'username','alert-error')}">
			  		<g:renderErrors bean="${user}" field="username"/>
			  		<g:textField name="login" id="loginUser" type="text" value="${user?.username}" />
			  	</div>
			  	<label><g:message code="user.form.password"/></label>
			  	<div class="${hasErrors(bean:user, field:'password', 'alert-error')}">
			  		<g:renderErrors bean="${user}" field="password"/>
				    <g:passwordField name="password" value="${user?.password}"/>
				 </div>
			  	<label><g:message code="user.form.confirm.password"/></label>
			  	<div  class="${hasErrors(bean:user, field:'password', 'alert-error')}">
			  		<g:renderErrors bean="${user}" field="password" />
			  		<g:passwordField name="confirmPassword" value="${confirmPassword}"/>
			  	</div>
			  	<label><g:message code="user.form.email"/></label>
					<div class="${hasErrors(bean:user,field:'email','alert-error')}">
					<g:renderErrors bean="${user}" field="email"/>
			  	<g:textField name="email" type="email" value="${user?.email}" />
			  	</div>
			  	<g:submitButton name="submit" type="submit" value="user.form.location" class="btn ${user?.hasErrors() ? 'btn-danger' : 'btn-primary'} formButton"/>
			</g:form>
		<br/>
	</body>
</html>
