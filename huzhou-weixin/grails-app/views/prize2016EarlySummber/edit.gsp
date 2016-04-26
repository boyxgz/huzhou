<%@ page import="com.surelution.huzhou.Prize2016EarlySummber" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'prize2016EarlySummber.label', default: 'Prize2016EarlySummber')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<style type="text/css">
			.modal-header{padding:0px;}
		</style>
	</head>
	<body>
		<div class="modal-header">
			<h3><b><g:message code="default.edit.label" args="[entityName]" /></b></h3>
		</div>
		<g:form method="post" >
			<div id="edit-prize2016EarlySummber" class="modal-body" role="main">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${prize2016EarlySummberInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${prize2016EarlySummberInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
					<g:hiddenField name="id" value="${prize2016EarlySummberInstance?.id}" />
					<g:hiddenField name="version" value="${prize2016EarlySummberInstance?.version}" />
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
			</div>
			<div class="modal-footer">
				<fieldset class="buttons">
					<g:actionSubmit class="btn-primary btn" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<input type="button" class="btn btn-default" value="取消" data-dismiss="modal"/>
				</fieldset>
			</div>
		</g:form>
	</body>
</html>
