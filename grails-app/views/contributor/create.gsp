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
			<g:renderErrors bean="${user}" />
			<g:form class="user_form" action="createUser" controller="contributor">
			  	<label><g:message code="user.creation.form.login"/></label>
			  	<g:textField name="login" type="text" value="${user?.username}" class='${hasErrors(bean:user,field:'login','error')}'/>
			  	<br/><br/>
			  	<label><g:message code="user.creation.form.password"/></label>
			  	<g:passwordField name="password" value="${user?.password}" class='${hasErrors(bean:user,field:'password','error')}'/>
			  	<br/><br/>
			  	<label><g:message code="user.creation.form.confirm.password"/></label>
			  	<g:passwordField name="confirmPassword" value="${confirmPassword}" class='${hasErrors(bean:user,field:'confirmPassword','error')}'/>
			  	<br/><br/>
			  	<label><g:message code="user.creation.form.email"/></label>
			  	<g:textField name="email" type="email" value="${user?.email}" class='${hasErrors(bean:user,field:'email','error')}'/>
			  	<br/><br/>
			  	<g:submitButton name="submit" type="submit" value="Submit" />
			</g:form>
		</div>
		<br/>
	</body>
</html>
