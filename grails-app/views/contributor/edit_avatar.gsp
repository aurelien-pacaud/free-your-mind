<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind</title>		
	</head>
	<body>
		<div>
			<h2><g:message code="user.update.title"/></h2>
			<g:renderErrors bean="${user}" />
			<fieldset>
				  <legend><g:message code="user.profile.avatar.upload"/></legend>
				  <g:form action="upload_avatar" method="post" enctype="multipart/form-data">
				    <label for="avatar"><g:message code="user.profile.avatar"/></label>
				    <input type="file" name="avatar" id="avatar" />
				    <g:hiddenField name="id" value="${user?.id}" />
				    <input type="submit" class="buttons" value="Upload" />
				  </g:form>
			</fieldset>
		</div>
		<br/>
	</body>
</html>
