<!doctype html>
<html>
	<head>
		<title>中奖报表</title>
		<meta name="layout" content="jarvis" />
		<link rel="stylesheet" href="${resource(file:'css/bootstrap.min.css') }"/>
		<script type="text/javascript" src="${resource(file:'js/bootstrap.min.js') }"></script>
		<style type="text/css">
			.box{margin-top:30px;}
			.table{width:92%; margin-left:4%; margin-top:20px;}
			.table-seek{width:50%; text-align: right; line-height:50px;}
			td{border:0px solid red;}
		</style>
	</head>
	<body>
		<div class="content-wrapper">
			<div class="container">
				<div class="box box-info">
					<br/>
					<form action="scanningQr">
						<table class="table-seek">
							<tr>
								<td width="200" style="font-size:16px;" ><b>时间&nbsp;&nbsp;&nbsp;</b></td>
								<td width="250">
									<input type="text" class="form-control" id="startAt" name="startAt"/>
											<script type="text/javascript">
												$('#startAt').datetimepicker({
													isRTL:false,
													format:'yyyy-mm-dd',
													autoclose:true,
													minView:'month',
													language:'zh-CN'
												});
											</script>
								</td>
								<td width="20">~&nbsp;&nbsp;</td>
								<td width="250">
									<input type="text" class="form-control" id="endAt" name="endAt"/>
									<script type="text/javascript">
										$('#endAt').datetimepicker({
											isRTL:false,
											format:'yyyy-mm-dd',
											autoclose:true,
											minView:'month',
											language:'zh-CN'
										});
									</script>
								</td>
								<%--<td align="center" width="200">
									<g:select class="form-control"name="isTrue" from="${[[keyword:true,value:"已兑换"],[keyword:false,value:"未兑换"]] }"  optionKey="keyword" optionValue="value" />
								</td>--%>
								<td width="150" align="center"><input type="submit" value="查询" class="btn btn-info" /></td>
							</tr>
						</table>
					</form>
					<br/>
					<table class="table table-bordered table-respose">
						<thead>
							<tr>
								<th>时间</th>
								<th>渠道</th>
								<th>数量</th>
							</tr>
						</thead>
						<tbody>
							<g:each in="${gasStation }" status="i" var="gs">
							<g:if test="${gs[0]}">
							<tr>
								<td>
									<g:formatDate date="${startAt }" format="yyyy-MM-dd"/>
									~
									<g:formatDate date="${endAt }" format="yyyy-MM-dd"/>
								</td>
								<td>${gs[0]?.name }</td>
								<td>${gs[1] }</td>
							</tr>
							</g:if>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${1}"  />
					</div>
				</div>
			</div>	
		</div>
	</body>
</html>
