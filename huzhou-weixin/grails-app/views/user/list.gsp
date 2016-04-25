
<%@ page import="com.surelution.huzhou.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
			.box{ margin-top:35px;}
			.table{width:96%; margin-left:2%;}
		</style>
	</head>
	<body>
		<div class="content-wrapper">
			<div class="container">
				<div id="list-user" class="box box-info">
					<h1><g:message code="user.list.label" default="User List" args="[entityName]" /></h1>
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<div class="row">
						<div class="col-md-4">
							<g:link action="create" controller="User" data-toggle="modal" data-target="#createUser" style="margin-left:21px;text-decoration:underline;">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新建用户</g:link>
							<div class="modal fade" id="createUser" role="dialog">
					             <div class="modal-dialog">
						             <div class="modal-content">
						             </div>
					             </div>
				             </div>	
						</div>
					</div>
					<table class="table table-bordered table-respose">
						<thead>
							<tr>
							
								<g:sortableColumn class="alink" property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
							
								<g:sortableColumn class="alink" property="accountExpired" title="${message(code: 'user.accountExpired.label', default: 'Account Expired')}" />
							
								<g:sortableColumn class="alink" property="accountLocked" title="${message(code: 'user.accountLocked.label', default: 'Account Locked')}" />
							
								<g:sortableColumn class="alink" property="enabled" title="${message(code: 'user.enabled.label', default: 'Enabled')}" />
							
								<g:sortableColumn class="alink" property="passwordExpired" title="${message(code: 'user.passwordExpired.label', default: 'Password Expired')}" />
							
							</tr>
						</thead>
						<tbody>
						<g:each in="${userInstanceList}" status="i" var="userInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							
								<td>${fieldValue(bean: userInstance, field: "username")}</td>
							
								<td><g:formatBoolean boolean="${userInstance.accountExpired}" /></td>
							
								<td><g:formatBoolean boolean="${userInstance.accountLocked}" /></td>
							
								<td><g:formatBoolean boolean="${userInstance.enabled}" /></td>
							
								<td><g:formatBoolean boolean="${userInstance.passwordExpired}" /></td>
							
							</tr>
						</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${userInstanceTotal}" />
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
