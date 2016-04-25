<!doctype html>
<%@page import="com.surelution.whistle.push.UserInfo"%>
<html>
	<head>
		<title>获奖报表</title>
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
					<h3>&nbsp;&nbsp;&nbsp;以兑奖报表</h3>
					<form action="gainPrize">
						<table class="table-seek">
							<tr>
								<td width="200" style="font-size:16px;" ><b>获奖时间&nbsp;&nbsp;&nbsp;</b></td>
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
					<table class="table table-bordered table-respose">
						<thead>
							<tr>
								<td>序列</td>
								<td>奖品</td>
								<td>获奖人微信昵称</td>
								<td>获奖时间</td>
								<td>获奖码</td>
							</tr>
						</thead>
						<tbody>
							<g:each in="${isGainPrize }" status="i" var="isGain">
							<tr>
								<td>${i+1 }</td>
								<td>${isGain?.prize?.name }</td>
								<td>${UserInfo.loadUserInfo(isGain?.subscriber?.openId).nickname }</td>
								<td>${isGain?.dateCreated }</td>
								<td>${isGain?.winningSn }</td>
							</tr>
							</g:each>
						</tbody>
					</table>
					<br />
					<div class="pagination">
						<g:paginate total="${DrawingTicketTotal}" params="${params }" />
					</div>
				</div>
			</div>	
		</div>
	</body>
</html>
