
<%@ page import="com.surelution.huzhou.Prize2016EarlySummber" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'prize2016EarlySummber.label', default: 'Prize2016EarlySummber')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
			.box{ margin-top:35px;}
			.table{width:96%; margin-left:2%;}
			.modalstyle{ width: 40%; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; height:45%; margin-top:5%; border-radius:5px;}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				if(${flash.message} != null){
					alert($(flash.message));
				}
			})
		</script>
	</head>
	<body>
		<div class="content-wrapper">
		<div class="container">
		<div id="list-prize2016EarlySummber" class="box box-info" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="row">
				<div class="col-md-4">
					<g:link action="create" data-toggle="modal" data-target="#createUser" style="margin-left:21px;text-decoration:underline;">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新建奖项</g:link>
					<div class="modal fade" id="createUser" role="dialog">
			             <div class="modal-dialog">
				             <div class="modal-content">
				             </div>
			             </div>
		             </div>	
				</div>
			</div>
			<table class="table table-bordered table-repose">
				<thead>
					<tr>
						<g:sortableColumn class="alink" property="name" title="${message(code: 'prize2016EarlySummber.name.label', default: 'Name')}" />
					
						<g:sortableColumn class="alink" property="description" title="${message(code: 'prize2016EarlySummber.description.label', default: 'Description')}" />
					
						<g:sortableColumn class="alink" property="amount" title="${message(code: 'prize2016EarlySummber.amount.label', default: 'Amount')}" />
						
						<th>商品总量</th>
						
						<g:sortableColumn class="alink" property="positions" title="${message(code: 'prize2016EarlySummber.positions.label', default: 'Positions')}" />
						
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
				<g:each in="${prize2016EarlySummberInstanceList}" status="i" var="prize2016EarlySummberInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
						<td><g:link action="show" id="${prize2016EarlySummberInstance.id}">${fieldValue(bean: prize2016EarlySummberInstance, field: "name")}</g:link></td>
						
						<td>${fieldValue(bean: prize2016EarlySummberInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: prize2016EarlySummberInstance, field: "amount")}</td>
						<td>${ prize2016EarlySummberInstance?.quantity}</td>
						<td>${fieldValue(bean: prize2016EarlySummberInstance, field: "positions")}</td>
						
						<td>
							<a href="${createLink(action:'delete',id:prize2016EarlySummberInstance.id) }" onclick="return confirm('${message(code:'default.button.delete.confirm.message',default:'亲，确认删除嘛？ ')}')" class="glyphicon glyphicon-trash" data-toggle="tooltip" title="删除"></a>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a data-toggle="modal" href="${createLink(action:'edit',id:prize2016EarlySummberInstance.id) }" data-target="#editUser" class="glyphicon glyphicon-pencil" title="编辑"></a>
									<div class="modal" id="editUser" role="dialog">
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
				<g:paginate total="${prize2016EarlySummberInstanceTotal}" />
			</div>
		</div>
		</div>
		</div>
	</body>
</html>
