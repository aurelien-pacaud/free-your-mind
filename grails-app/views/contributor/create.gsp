<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind</title>		
	</head>
	<body>
		<h2>Create a new account</h2>
		<g:renderErrors bean="${user}" />
		<g:form class="user_form" action="createUser" controller="contributor">
	  		<label>First name</label>
			<g:textField name="firstName" value="${user?.firstName}" class='${hasErrors(bean:user,field:'firstName','error')}'/>
		  	<br/><br/>
		  	<label>Last name</label>
		  	<g:textField name="lastName" value="${user?.lastName}" class='${hasErrors(bean:user,field:'lastName','error')}'/>
		  	<br/><br/>
		  	<label>Login</label>
		  	<g:textField name="login" type="text" value="${user?.login}" class='${hasErrors(bean:user,field:'login','error')}'/>
		  	<br/><br/>
		  	<label>Password</label>
		  	<g:passwordField name="password" value="${user?.password}" class='${hasErrors(bean:user,field:'password','error')}'/>
		  	<br/><br/>
		  	<label>Email</label>
		  	<g:textField name="email" type="email" value="${user?.email}" class='${hasErrors(bean:user,field:'email','error')}'/>
		  	<br/><br/>
		  	<label>Birth date</label>
		  	<g:datePicker name="birthDate" precision="day" value="${user?.birthDate}" class='${hasErrors(bean:user,field:'birthDate','error')}'/>
		  	<br/><br/>
		  	<label>Location</label>
	  		<g:textField name="location" value="${user?.location}" class='${hasErrors(bean:user,field:'location','error')}'/>
	  		<br />			  	
		  	<g:submitButton name="submit" type="submit" value="Submit" />
		</g:form>
		<br/>
	</body>
</html>
