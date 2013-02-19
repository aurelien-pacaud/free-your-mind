<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind</title>		
	</head>
	<body>
		<div>
			<h2><g:message code="user.creation.title"/></h2>
			<br/>
			<g:form class="user_form" action="createUser" controller="contributor">
			  	<label><g:message code="user.creation.form.login"/></label>
			  	<div class='${hasErrors(bean:user,field:'username','alert-error')}'>
			  		<g:renderErrors bean="${user}" field="username"/>
			  		<g:textField name="login" id="loginUser" type="text" value="${user?.username}" />
			  	</div>
			  	<label><g:message code="user.creation.form.password"/></label>
			  	<div class="${hasErrors(bean:user,field:'password','alert-error')}">
			  		<g:renderErrors bean="${user}" field="password"/>
				    <g:passwordField name="password" value="${user?.password}"/>
				 </div>
			  	<label><g:message code="user.creation.form.confirm.password"/></label>
			  	<div  class='${hasErrors(bean:user,field:'password','alert-error')}'">
			  		<g:renderErrors bean="${user}" field="password" />
			  		<g:passwordField name="confirmPassword" value="${confirmPassword}"/>
			  	</div>
			  	<label><g:message code="user.creation.form.email"/></label>
					<div class='${hasErrors(bean:user,field:'email','alert-error')}'>
					<g:renderErrors bean="${user}" field="email"/>
			  	<g:textField name="email" type="email" value="${user?.email}" />
			  	</div>
			  	<g:submitButton name="submit" type="submit" value="Submit" />
			</g:form>
		</div>
		<br/>
	</body>
</html>
