<%@ page import="com.surelution.huzhou.User" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="user.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="modal-header">
			<h4><g:message code="user.create.label" args="[entityName]" /></h4>
		</div>
		<g:form action="save" >
		<div id="create-user" class="modal-body" role="main">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
				<fieldset class="form">
					<dl class="dl-horizontal">
						<dt>
							<label for="username">
								<g:message code="user.username.label" default="Username" />
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<g:textField name="username" class="form-control" required="" value="${userInstance?.username}"/>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="password">
								<g:message code="user.password.label" default="Password" />
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<g:textField name="password" class="form-control" required="" value="${userInstance?.password}"/>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
						<label for="accountExpired">
							<g:message code="user.accountExpired.label" default="Account Expired" />
						</label>
						</dt>
						<dd>
							<g:checkBox name="accountExpired" class="form-control" value="${userInstance?.accountExpired}" />
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="accountLocked">
								<g:message code="user.accountLocked.label" default="Account Locked" />
							</label>
						</dt>
						<dd>
							<g:checkBox name="accountLocked" class="form-control" value="${userInstance?.accountLocked}" />
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="enabled">
								<g:message code="user.enabled.label" default="Enabled" />
							</label>
						</dt>
						<dd>
							<g:checkBox name="enabled" class="form-control" value="${userInstance?.enabled}" />
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="passwordExpired">
								<g:message code="user.passwordExpired.label" default="Password Expired" />
							</label>
						</dt>
						<dd>
							<g:checkBox name="passwordExpired" class="form-control"  value="${userInstance?.passwordExpired}" />
						</dd>
					</dl>
				</fieldset>
			</div>
			<div class="modal-footer">
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
		</div>
		</g:form>
	</body>
</html>
