<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind</title>		
	</head>
	<body>
		<br />
		<div style="width : 70%; float : left;">
			<h2>Create a new account</h2>
			<g:renderErrors bean="${user}" />
			<g:form class="user_form" action="createUser" controller="contributor">
				<fieldset>
					<label>First name</label>
				  	<g:textField name="firstName" />
				  	<br/><br/>
				  	<label>Last name</label>
				  	<g:textField name="lastName" />
				  	<br/><br/>
				  	<label>Login</label>
				  	<g:textField name="login" type="password" />
				  	<br/><br/>
				  	<label>Password</label>
				  	<g:textField name="password" />
				  	<br/><br/>
				  	<label>Email</label>
				  	<g:textField name="email"  type="email"/>
				  	<br/><br/>
				  	<label>Birth date</label>
				  	<g:datePicker name="birthDate" precision="day" />
				  	<br/><br/>
				  	<label>Location</label>
				  	<g:textField name="location" />
				  	<br/><br/>	 			  	
				  	<input type="submit" value="Submit"></input>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
