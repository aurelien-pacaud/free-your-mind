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
		  		<label><g:message code="user.creation.form.firstName"/></label>
				<g:textField name="firstName" value="${user?.firstName}" class='${hasErrors(bean:user,field:'firstName','error')}'/>
			  	<br/><br/>
			  	<label><g:message code="user.creation.form.lastName"/></label>
			  	<g:textField name="lastName" value="${user?.lastName}" class='${hasErrors(bean:user,field:'lastName','error')}'/>
			  	<br/><br/>
			  	<label><g:message code="user.creation.form.login"/></label>
			  	<g:textField name="login" type="text" value="${user?.login}" class='${hasErrors(bean:user,field:'login','error')}'/>
			  	<br/><br/>
			  	<label><g:message code="user.creation.form.password"/></label>
			  	<g:passwordField name="password" value="${user?.password}" class='${hasErrors(bean:user,field:'password','error')}'/>
			  	<br/><br/>
			  	<label><g:message code="user.creation.form.email"/></label>
			  	<g:textField name="email" type="email" value="${user?.email}" class='${hasErrors(bean:user,field:'email','error')}'/>
			  	<br/><br/>
			  	<label><g:message code="user.creation.form.birthDate"/></label>
			  	<g:datePicker name="birthDate" precision="day" value="${user?.birthDate}" class='${hasErrors(bean:user,field:'birthDate','error')}'/>
			  	<br/><br/>
			  	<label><g:message code="user.creation.form.location"/></label>
		  		<g:textField name="location" value="${user?.location}" class='${hasErrors(bean:user,field:'location','error')}'/>
		  		<br/><br/>	
			  	<g:submitButton name="submit" type="submit" value="Submit" />
			</g:form>
		</div>
		<br/>
	</body>
</html>
