<%@page import="com.surelution.huzhou.KeyedMessage" %>
<%@page import="com.surelution.huzhou.Prize2016EarlySummber" %>
<%@page import="grails.util.Holders" %>
<!doctype html>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, user-scalable=no">
		<link rel="stylesheet" href="${resource(file:'css/bootstrap.min.css') }" type="text/css"/>
		<script type="text/javascript" src="${resource(file:'js/bootstrap.min.js') }"></script>
		<link rel="stylesheet" href="${resource(file:'css/myself.css') }" type="text/css" />
		<script type="text/javascript" src="${resource(file:'js/jquery.min.js') }"></script>
		<title>我要送你“游”</title>
		<wx:registerJsapi apiList="'onMenuShareTimeline','onMenuShareAppMessage'"/>
		<script type="text/javascript">
			wx.ready(function(){
				wx.onMenuShareTimeline({
				    title: '${KeyedMessage.findByKey("Ranking-share-title").message}', // 分享标题
				    link: '${url}',  // 分享链接
				    imgUrl: '${Holders.config.grails.serverURL}/images/2.jpg', // 分享图标
				    success: function () {
				        // 用户确认分享后执行的回调函数
				    },
				    cancel: function () { 
				        // 用户取消分享后执行的回调函数
				    }
				});
				wx.onMenuShareAppMessage({
				    title: '${KeyedMessage.findByKey("Ranking-share-title")?.message}', // 分享标题
				    desc: '${KeyedMessage.findByKey("Ranking-share-desc")?.message}', // 分享描述
				    link: '${url}', // 分享链接
				    imgUrl: '${Holders.config.grails.serverURL}/images/2.jpg', // 分享图标
				    type: 'link', // 分享类型,music、video或link，不填默认为link
				    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
				    success: function () { 
				        // 用户确认分享后执行的回调函数
				    },
				    cancel: function () {
				        // 用户取消分享后执行的回调函数
				    }
				});
			});
		</script>
		<style>
			body{background-color:rgba(185, 205, 203, 0.47);}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="col-xs-12 col-sm-12 box">
				<p class="text-content" style="color:red;">${KeyedMessage.findByKey("Welcome-to-language").message }</p>
			</div>
			<div class="col-xs-4 col-sm-4 left-offset">
				<g:if test="${isDrawingSub.drawingAt == null }">
					<g:link action="callingInformation" controller="Event2016EarlySummber" id="${isDrawingSub?.id }">
						<input type="button" value="戳我抽奖哦" class="btn btn-default"/>
					</g:link>
				</g:if>
				<g:else>
					<g:link action="callingInformation">
						<input type="button" value="查看抽奖情况" class="btn btn-default" />
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
							<td>${prize?.quantity }</td>
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