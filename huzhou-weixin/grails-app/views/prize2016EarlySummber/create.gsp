<%@ page import="com.surelution.huzhou.Prize2016EarlySummber" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'prize2016EarlySummber.label', default: 'Prize2016EarlySummber')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="modal-header">
			<h3><g:message code="default.create.label" args="[entityName]" /></h3>
		</div>
		<g:form action="save" >
			<div id="create-prize2016EarlySummber" class="modal-body" role="main">
				<g:hasErrors bean="${prize2016EarlySummberInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${prize2016EarlySummberInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
			</div>
			<div class="modal-footer">
				<fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</div>
		</g:form>
	</body>
</html>
