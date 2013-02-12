<!DOCTYPE html>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'rainbow.css')}" type="text/css">
		<script src="${resource(dir: 'js', file: 'highlight.pack.js')}"></script>
                <script>hljs.initHighlightingOnLoad();</script>
		
		<g:javascript library="jquery" plugin="jquery"/>		
		<g:javascript library="jquery-ui"/>
		<g:layoutHead/>
		<r:require modules="bootstrap"/>
		<r:layoutResources />

		<g:javascript src="main.js" />
		<jq:jquery>
			 $("#log").click(function ( ) {
			    hideOrShow("#divLog");
			 });
			 
			 $(function() {
				    var button = $('#loginButton');
				    var box = $('#loginBox');
				    var form = $('#loginForm');
				    button.removeAttr('href');
				    button.mouseup(function(login) {
				        box.toggle();
				        button.toggleClass('active');
				    });
				    form.mouseup(function() { 
				        return false;
				    });
				    $(this).mouseup(function(login) {
				        if(!($(login.target).parent('#loginButton').length > 0)) {
				            button.removeClass('active');
				            box.hide();
				        }
				    });
				});
		</jq:jquery>
		
	</head>
	<body>
		<div id="topMenu">
			<div style="float:left;"><g:img file="fym-logo.png" style="width : 44px; height : 44px; vertical-align : middle;"/></div>
			<ul>
				<li><g:link controller="Index" action="index" class="${locality.equals('index') ? 'active' : '' }">Questions</g:link></li>
				<li><g:link controller="Tag" action="list" class="${locality.equals('tag') ? 'active' : '' }">Tags</g:link></li>
				<li><g:link controller="Contributor" action="list" class="${locality.equals('user') ? 'active' : '' }">Users</g:link></li>
				<li><g:link controller="Question" action="create" class="${locality.equals('ask') ? 'active' : '' }">Ask Question</g:link></li>
				<li id="lastMenu">
                    <sec:ifAllGranted roles="ROLE_USER">
			           <g:link controller="logout" action="index">
			           		<sec:loggedInUserInfo field="username" />
			           </g:link>
                       <!--  Ajouter menu drop down -->
                    </sec:ifAllGranted>
                    <sec:ifNotGranted roles="ROLE_USER">
	                    <div id="loginContainer">
			                <a id="loginButton"><span>Login</span><em></em></a>
			                <div style="clear:both"></div>
			                <div id="loginBox">                
			                    <form action='/free-your-mind/j_spring_security_check' method='POST' id='loginForm' autocomplete='off'>
			                        <fieldset id="body">
			                            <fieldset>
			                                <label for="username">User name</label>
			                                <input type="text" name="j_username" id="username" />
			                            </fieldset>
			                            <fieldset>
			                                <label for="password">Password</label>
			                                <input type="password" name="j_password" id="password" />
			                            </fieldset>
			                            <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
			                            <label for="checkbox"><input type="checkbox" id="checkbox" />Remember me</label>
			                        </fieldset>
			                    </form>
			                </div>
	            		</div>
	            	</sec:ifNotGranted>
                </li>
			</ul>
		</div>
		<div id="content" class="clean">
            <g:set var="user" bean="getAuthenticatedUser()"/>	
			<g:layoutBody/>
		</div>
	</body>
</html>
