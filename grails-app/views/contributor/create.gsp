<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind</title>		
	</head>
	<body>
		<br />
		<div style="width : 70%; padding-left: 15%">
			<h2>Create a new account</h2>
			<g:renderErrors bean="${user}" />
			<g:form class="user_form" action="createUser" controller="contributor">
				<fieldset>
					<g:if test="${user == null}">
						<label>First name</label>
					  	<g:textField name="firstName"/>
					  	<br/><br/>
					  	<label>Last name</label>
					  	<g:textField name="lastName"/>
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
				  	</g:if>
				  	<g:else>
				  		<label>First name</label>
				  		<div class='value${hasErrors(bean:user,field:'firstName','_errors')}'>
							<g:textField name="firstName" value="${user.firstName}"/>
						</div>
					  	<br/><br/>
					  	<label>Last name</label>
					  	<div class='value${hasErrors(bean:user,field:'lastName','_errors')}'>
					  		<g:textField name="lastName" value="${user.lastName}" />
					  	</div>
					  	<br/><br/>
					  	<label>Login</label>
					  	<div class='value${hasErrors(bean:user,field:'login','_errors')}'>
					  		<g:textField name="login" type="password" value="${user.login}"/>
					  	</div>
					  	<br/><br/>
					  	<label>Password</label>
					  	<div class='value${hasErrors(bean:user,field:'password','_errors')}'>
					  		<g:textField name="password"  value="${user.password}"/>
					  	</div>
					  	<br/><br/>
					  	<label>Email</label>
					  	<div class='value${hasErrors(bean:user,field:'email','_errors')}'>
					  		<g:textField name="email"  type="email"  value="${user.email}"/>
					  	</div>
					  	<br/><br/>
					  	<label>Birth date</label>
					  	<div class='value${hasErrors(bean:user,field:'birthDate','_errors')}'>
					  		<g:datePicker name="birthDate" precision="day"  value="${user.birthDate}"/>
					  	</div>
					  	<br/><br/>
					  	<label>Location</label>
					  	<div class='value${hasErrors(bean:user,field:'location','_errors')}'>
					  		<g:textField name="location"  value="${user.location}"/>
					  	</div>
				  	</g:else>
				  	<br/><br/>	 			  	
				  	<input type="submit" value="Submit"></input>
				</fieldset>
			</g:form>
			<br/>
		</div>
	</body>
</html>
