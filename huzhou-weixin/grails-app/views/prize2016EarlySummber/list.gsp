
<%@ page import="com.surelution.huzhou.Prize2016EarlySummber" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'prize2016EarlySummber.label', default: 'Prize2016EarlySummber')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
			.box{margin-top:35px;}
			.table{width:96%; margin-left:2%;}
			h3{padding:15px;}
			.modalstyle{ width: 40%; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; height:58%; margin-top:5%; border-radius:5px;}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				if("${flash.message}"){
					alert("${flash.message}");
				}
			})
		</script>
	</head>
	<body>
	<div class="content-wrapper">
	<div class="container">
		<div class="box box-info" role="main">
			<h3><g:message code="default.list.label" args="[entityName]" /></h3>
			<div class="row">
				<div class="col-md-4">
					<g:link action="create" controller="prize2016EarlySummber" data-toggle="modal" data-target="#createPrize" style="margin-left:21px;text-decoration:underline;">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新建奖项</g:link>
					<div class="modal fade" id="createPrize" role="dialog">
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
						<g:sortableColumn class="alink" property="name" title="${message(code: 'prize2016EarlySummber.name.label', default: 'Name')}" />
					
						<g:sortableColumn class="alink" property="description" title="${message(code: 'prize2016EarlySummber.description.label', default: 'Description')}" />
					
						<g:sortableColumn class="alink" property="amount" title="${message(code: 'prize2016EarlySummber.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn class="alink" property="index" title="${message(code: 'prize2016EarlySummber.index.label', default: 'Index')}" />
						
						<g:sortableColumn class="alink" property="valuable" title="${message(code: 'prize2016EarlySummber.valuable.label', default: 'Valuable')}" />
						
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${prize2016EarlySummberInstanceList}" status="i" var="prize2016EarlySummberInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
						<td><g:link action="show" id="${prize2016EarlySummberInstance.id}">${fieldValue(bean: prize2016EarlySummberInstance, field: "name")}</g:link></td>
						
						<td>${fieldValue(bean: prize2016EarlySummberInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: prize2016EarlySummberInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: prize2016EarlySummberInstance, field: "index")}</td>
						
						<td><g:if test="${prize2016EarlySummberInstance.valuable}">是</g:if><g:else>否</g:else></td>
						
						<td>
							<a href="${createLink(action:'delete',controller:'prize2016EarlySummber',id:prize2016EarlySummberInstance.id) }" onclick="return confirm('${message(code:'default.button.delete.confirm.message',default:'亲，确认删除嘛？ ')}')" class="glyphicon glyphicon-trash" data-toggle="tooltip" title="删除"></a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a data-toggle="modal" href="${createLink(action:'edit',controller:'prize2016EarlySummber',id:prize2016EarlySummberInstance.id) }" data-target="#editPrize" class="glyphicon glyphicon-pencil" title="编辑"></a>
							<div class="modal" id="editPrize" role="dialog">
					        	<div class="modal-dialog">
						             <div class="modal-content">
						             </div>
					            </div>
				            </div>
				            <script type="text/javascript">
								$(function(){
									$("a[data-target=#editPrize]").click(function(event) {
										$(this).data('editPrize',null)
									    event.preventDefault();
									    var target = $(this).attr("href"); 
										    $("#editPrize").load(target, function() { 
										    	$("#editPrize").addClass("modalstyle")
								                $("#editPrize").modal('show');  }); 				    	
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
