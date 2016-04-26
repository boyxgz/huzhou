<%@page import="com.surelution.huzhou.KeyedMessage" %>
<!doctype html>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, user-scalable=no">
		<link rel="stylesheet" href="${resource(file:'css/bootstrap.min.css') }" type="text/css"/>
		<script type="text/javascript" src="${resource(file:'js/bootstrap.min.js') }"></script>
		<link rel="stylesheet" href="${resource(file:'css/myself.css') }" type="text/css" />
		<script type="text/javascript" src="${resource(file:'js/jquery.min.js') }"></script>
		<title>助力情况页</title>
		<style>
			body{background-color:rgba(185, 205, 203, 0.47);}
			.table{text-align: center;}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="col-xs-12 col-sm-12 box text-content">
				<p>${KeyedMessage.findByKey("Calling-Welcome").message.replace("##", resposingNum.toString()) }</p>
				<p>${KeyedMessage.findByKey("Ranking").message.replace("##", topAt.toString()) }</p>
				<p>${KeyedMessage.findByKey("Ranking-First").message.replace("##", "1") }</p>
				<p>${KeyedMessage.findByKey("Ranking-Last").message.replace("##", "1") }</p>
			</div>
			<table class="table table-bordered table-respose">
				<thead><tr>
					<th style="width:14%;">序号</th>
					<th style="width:24%;">抽奖时间</th>
					<th style="width:22%;">抽奖方式</th>
					<th style="width:22%;">中奖情况</th>
					<th style="width:18%;">中奖码</th>					
				</tr></thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><g:formatDate date="${drawingTicketSub?.dateCreated }" format="MM/dd HH:mm"/></td>
						<td>关注</td>
						<td>
							<g:if test="${drawingTicketSub?.prize?.name == "谢谢惠顾" }">
								未中奖
							</g:if>
							<g:else>${drawingTicketSub?.prize?.name }</g:else>
						</td>
						<td>${drawingTicketSub?.winningSn }</td>
					</tr>
					<g:each in="${drawingTicketSca }" status="i" var="sca"><tr>
						<td>${i+2 }</td>
						<td><g:formatDate date="${sca?.dateCreated }" format="MM/dd HH:mm"/></td>
						<td>扫码</td>
						<td>
							<g:if test="${sca?.prize?.name == "谢谢惠顾" }">
								未中奖
							</g:if>
							<g:else>${sca?.prize?.name }</g:else>
						</td>
						<td>${sca?.winningSn }</td>	
					</tr></g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>