
<%@ page import="com.surelution.huzhou.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="user.show.label" args="[entityName]" /></title>
		<style>
			.box{ margin-top:35px;}
			.buttons{ padding: 15px; margin-left: 10px;}
			.user{ padding-left: 130px; line-height: 40px;}
			h3{padding:15px;}
		</style>
	</head>
	<body>
	<div class="content-wrapper">
	<div class="container">
		<div id="show-user" class="box box-info" role="main">
			<h3><g:message code="user.show.label" args="[entityName]" /></h3>
			<g:if test="${false}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<dl class="dl-horizontal">
				<dt>
					<g:message code="user.username.label" default="Username" />
				</dt>
				<dd><div class="col-md-4">
					<input type="text" value="${userInstance?.username}" class="form-control" name="username" id="username"/>
				</div></dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<g:message code="user.enabled.label" default="Account Expired" />
				</dt>
				<dd><div class="col-md-4">
					<input type="text" value="<g:if test="${userInstance?.enabled}">是</g:if><g:else>否</g:else>" class="form-control" name="enabled" id="enabled" />
				</div></dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>当前权限</dt>
				<dd><div class="col-md-4">
					<input type="text" class="form-control" value="${role?.description }" />
				</div></dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>选择权限</dt>
				<dd><div class="col-md-4">
					<g:select name="role" value="${role?.description }" from="${com.surelution.huzhou.Role.list() }" 
					optionKey="id" optionValue="description" class="form-control" name="roleSelelct" id="roleSelect"/>
				</div></dd>
			</dl>
			<g:form action="update">
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${userInstance?.id}" />
				<input type="hidden" name="role" id="role" value="${role?.id }" />
				<input type="submit" value="<g:message code="default.button.confirm.label" default="confirm" />" class="btn btn-primary" />
				<g:actionSubmit class="btn btn-warning" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
			</g:form>
		<br/>
		</div>
	</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#roleSelect").change(function(){
				$("#role").val($("#roleSelect").val());
			})
		});
	</script>
	</body>
</html>
