
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
			.modalstyle{ width: 40%; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; height:45%; margin-top:5%; border-radius:5px;}
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
								
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<g:each in="${userInstanceList}" status="i" var="userInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							
								<td><g:link action="show" id="${userInstance?.id }">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
							
								<td><g:if test="${userInstance.accountExpired}">是</g:if><g:else>否</g:else></td>
							
								<td><g:if test="${userInstance.accountLocked}">是</g:if><g:else>否</g:else></td>
							
								<td><g:if test="${userInstance.enabled}">是</g:if><g:else>否</g:else></td>
							
								<td><g:if test="${userInstance.passwordExpired}">是</g:if><g:else>否</g:else></td>
								
								<td>
									<a href="${createLink(action:'delete',controller:'user',id:userInstance.id) }" onclick="return confirm('${message(code:'default.button.delete.confirm.message',default:'亲，确认删除嘛？ ')}')" class="glyphicon glyphicon-trash" data-toggle="tooltip" title="删除"></a>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a data-toggle="modal" href="${createLink(action:'edit',controller:'user',id:userInstance.id) }" data-target="#editUser" class="glyphicon glyphicon-pencil" title="编辑"></a>
									<div class="modal fade" id="editUser" role="dialog">
							        	<div class="modal-dialog">
								             <div class="modal-content">
								             </div>
							            </div>
						            </div>
						            <script type="text/javascript">
										$(function(){
											$("a[data-target=#editUser]").click(function(event) {
												$(this).data('editUser',null)
											    event.preventDefault();
											    var target = $(this).attr("href"); 
												    $("#editUser").load(target, function() { 
												    	$("#editUser").addClass("modalstyle")
										                $("#editUser").modal('show');  }); 				    	
												    });
											});
									</script>
								</td>
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
									