
<%@ page import="com.surelution.huzhou.Prize2016EarlySummber" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prize2016EarlySummber.label', default: 'Prize2016EarlySummber')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-prize2016EarlySummber" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-prize2016EarlySummber" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list prize2016EarlySummber">
			
				<g:if test="${prize2016EarlySummberInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="prize2016EarlySummber.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${prize2016EarlySummberInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prize2016EarlySummberInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="prize2016EarlySummber.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${prize2016EarlySummberInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prize2016EarlySummberInstance?.index}">
				<li class="fieldcontain">
					<span id="index-label" class="property-label"><g:message code="prize2016EarlySummber.index.label" default="Index" /></span>
					
						<span class="property-value" aria-labelledby="index-label"><g:fieldValue bean="${prize2016EarlySummberInstance}" field="index"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prize2016EarlySummberInstance?.luckyNum}">
				<li class="fieldcontain">
					<span id="luckyNum-label" class="property-label"><g:message code="prize2016EarlySummber.luckyNum.label" default="Lucky Num" /></span>
					
						<span class="property-value" aria-labelledby="luckyNum-label"><g:fieldValue bean="${prize2016EarlySummberInstance}" field="luckyNum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prize2016EarlySummberInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="prize2016EarlySummber.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${prize2016EarlySummberInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prize2016EarlySummberInstance?.positions}">
				<li class="fieldcontain">
					<span id="positions-label" class="property-label"><g:message code="prize2016EarlySummber.positions.label" default="Positions" /></span>
					
						<span class="property-value" aria-labelledby="positions-label"><g:fieldValue bean="${prize2016EarlySummberInstance}" field="positions"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prize2016EarlySummberInstance?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="prize2016EarlySummber.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${prize2016EarlySummberInstance}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prize2016EarlySummberInstance?.quantityPerDay}">
				<li class="fieldcontain">
					<span id="quantityPerDay-label" class="property-label"><g:message code="prize2016EarlySummber.quantityPerDay.label" default="Quantity Per Day" /></span>
					
						<span class="property-value" aria-labelledby="quantityPerDay-label"><g:fieldValue bean="${prize2016EarlySummberInstance}" field="quantityPerDay"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prize2016EarlySummberInstance?.valuable}">
				<li class="fieldcontain">
					<span id="valuable-label" class="property-label"><g:message code="prize2016EarlySummber.valuable.label" default="Valuable" /></span>
					
						<span class="property-value" aria-labelledby="valuable-label"><g:formatBoolean boolean="${prize2016EarlySummberInstance?.valuable}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${prize2016EarlySummberInstance?.id}" />
					<g:link class="edit" action="edit" id="${prize2016EarlySummberInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
