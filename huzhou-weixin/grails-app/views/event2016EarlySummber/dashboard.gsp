<%@page import="com.surelution.huzhou.KeyedMessage" %>
<%@page import="com.surelution.huzhou.Prize2016EarlySummber" %>
<!doctype html>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, user-scalable=no">
		<link rel="stylesheet" href="${resource(file:'css/bootstrap.min.css') }" type="text/css"/>
		<script type="text/javascript" src="${resource(file:'js/bootstrap.min.js') }"></script>
		<link rel="stylesheet" href="${resource(file:'css/myself.css') }" type="text/css" />
		<script type="text/javascript" src="${resource(file:'js/jquery.min.js') }"></script>
		<title>我来送你“游”</title>
		<style>
			body{background-color:rgba(185, 205, 203, 0.47);}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="col-xs-12 col-sm-12 box">
				<p class="text-content">${KeyedMessage.findByKey("Welcome-to-language").message }</p>
			</div>
			<div class="col-xs-4 col-sm-4 left-offset">
				<g:if test="${isDrawingSub.isUse == false }">
					<g:link action="drawing" controller="Event2016EarlySummber" id="">
						<input type="button" value="戳我抽奖哦" class="btn btn-default"/>
					</g:link>
				</g:if>
				<g:else>
					<g:link action="callingInformation">
						<input type="button" value="戳我查看您的抽奖情况哦" class="btn btn-default" />
					</g:link>
				</g:else>
			</div>
			<table class="table table-bordered table-respose">
				<thead><tr>
					<td style="width:28%;">类别</td>
					<td>金额（元）</td>
					<td>数量</td>
					<td style="width:30%;">奖品</td>
				</tr></thead>
				<tbody>
					<g:each in="${Prize2016EarlySummber.list() }" var="prize">
					<tr>
						<g:if test="${prize?.valuable }">
							<td>${prize?.name }</td>
							<td>${prize?.amount }</td>
							<td>${prize?.amount }</td>
							<td>${prize?.description }</td>
						</g:if>
					</tr>
					</g:each>				
				</tbody>
			</table>
			<div class="col-xs-12 col-sm-12 box">
				<p class="text-content">${KeyedMessage.findByKey("Activity-intro").message }</p>
			</div>
			<div class="col-xs-12 col-sm-12 box">
				<h4 class="title">活动指定加油站：</h4>
				<p>${KeyedMessage.findByKey("GasStatic").message }</p>
			</div>
			<div style="height:400px;"></div>
		</div>
	</body>
</html>