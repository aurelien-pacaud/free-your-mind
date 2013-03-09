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
            <r:require modules="bootstrap"/>
            <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
            <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
            <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
            <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
            <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
            <link rel="stylesheet" href="${resource(dir: 'css', file: 'github.css')}" type="text/css">
            <script src="${resource(dir: 'js', file: 'highlight.pack.js')}"></script>
            <script>hljs.initHighlightingOnLoad();</script>

            <g:javascript library="jquery" plugin="jquery"/>		
            <g:javascript library="jquery-ui"/>
            <g:layoutHead/>
            <r:layoutResources />

            <g:javascript src="main.js" />
            <g:javascript src="application.js" />
            <g:javascript plugin="twitter-bootstrap" src="bootstrap-tab.js"/>
          
            <jq:jquery>
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

                /*$(this).mouseup(function(login) {
                
                  if(!($(login.target).parent('#loginButton').length > 0)) {
                    button.removeClass('active');
                    box.hide();
                  }
                });*/
              });
            </jq:jquery>

          </head>
          <body>
            <div id="topMenuBackground">
              <div id="topMenu"> 
                <g:link controller="index" action="index">
                  <div class="logo" style="float:left;">
                    <g:img file="fym-logo.png" style="width : 44px; height : 44px; vertical-align : middle;"/>
                  </div>
                </g:link>
                <ul id="listMenu">
                  <li id="menuItem">
                    <g:link controller="question" action="list" class="${params.controller == 'question' && params.action != 'create' ? 'active' : '' }">
                      <g:message code="global.question" args="[0]"/>
                    </g:link>
                  </li>
                  <li id="menuItem">
                    <g:link controller="Tag" action="list" class="${params.controller == 'tag' ? 'active' : '' }">
                      <g:message code="global.tag" args="[0]"/>
                    </g:link>
                  </li>
                  <li id="menuItem">
                    <g:link controller="Award" action="list" class="${params.controller == 'baward' ? 'active' : '' }">
                      <g:message code="global.award" args="[0]"/>
                    </g:link>
                  </li>
                  <li id="menuItem">
                    <g:link controller="Contributor" action="list" class="${params.controller == 'contributor' ? 'active' : '' }">
                      <g:message code="global.user" args="[0]"/>
                    </g:link>
                  </li>
                  <li id="menuItem">
                    <g:link controller="Question" action="create" class="${params.action == 'create' && params.controller == 'question' ? 'active' : '' }">
                      <g:message code="global.askQuestion"/>
                    </g:link>
                  </li>
                  <li id="lastMenu" >
                  <sec:ifLoggedIn>
                  <div class="dropdown">
                    <a class="dropdown-toggle" id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="#" >
                      <sec:loggedInUserInfo field="username" />
                      <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                      <li role=presentation">
                      	<g:link controller="contributor" action="show" id="${sec.loggedInUserInfo(field: 'id')}"><g:message code="global.consult.profil"/> </g:link>
                      </li>
                      <li role=presentation">
                      	<g:link controller="contributor" action="edit" id="${sec.loggedInUserInfo(field: 'id')}"><g:message code="global.edit.profil"/></g:link>
                      </li>
                      <li role=presentation">
                      	<g:link controller="contributor" action="edit_avatar" id="${sec.loggedInUserInfo(field: 'id')}"><g:message code="global.change.avatar"/></g:link>
                      </li>
                      <li class="divider"></li>
                      <li  role=presentation">
                      	<g:link controller="logout" action="index"><g:message code="global.deconnect"/></g:link>
                      </li>
                    </ul>
                  </div>
                  </sec:ifLoggedIn>
                  <sec:ifNotLoggedIn >
                  <div id="loginContainer">
                    <a id="loginButton"><span><g:message code="global.login"/></span></a>
                    <div style="clear:both"></div>
                    <div id="loginBox">                
                      <form action='/free-your-mind/j_spring_security_check' method='POST' id='loginPopUpForm' autocomplete='off'>
                        <fieldset id="body">
                          <fieldset>
                            <label for="username"><g:message code="global.userName"/></label>
                            <input type="text" name="j_username" id="username" />
                          </fieldset>
                          <fieldset>
                            <label for="password"><g:message code="global.password"/></label>
                            <input type="password" name="j_password" id="password" />
                          </fieldset>
                          <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
                          <br/><br/>
                          <g:message code="global.or"/> <g:link controller="contributor" action="create"><g:message code="global.signin"/></g:link>
                          <br/>
                        </fieldset>
                      </form>
                    </div>
                  </div>
                  </sec:ifNotLoggedIn>
                  </li>
                </ul>
              </div>
            </div>

            <div id="content" class="clear">
              <jq:jquery>
                $('#message').delay(4000).fadeOut();
              </jq:jquery>
    
              <g:if test="${flash.message}">
                <div id="message" class="alert alert-success">
                  ${flash.message}
                </div>
              </g:if>

              <g:layoutBody/>
              <br />
            </div>
          </body>
        </html>
