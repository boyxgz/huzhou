<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'voucherBatch.label', default: 'VoucherBatch')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-voucherBatch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-voucherBatch" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${voucherBatchInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${voucherBatchInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="a" >
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: voucherBatchInstance, field: 'amount', 'error')} required">
						<label for="amount">
							<g:message code="voucherBatch.amount.label" default="Amount" />
							<span class="required-indicator">*</span>
						</label>
						<g:field type="number" name="amount" value="${params.amount}" required=""/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: voucherBatchInstance, field: 'countDaily', 'error')} required">
						<label for="step">
							Step
							<span class="required-indicator">*</span>
						</label>
						<g:field name="step" type="number" value="${params.step}" required=""/>
					</div>
					
					<div class="fieldcontain">
						<label for="nonce">
							Nonce
						</label>
						<g:textArea name="Nonce" type="text" value="${line}"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
