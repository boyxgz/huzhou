<%@page import="com.surelution.huzhou.KeyedMessage" %>
<%@page import="com.surelution.huzhou.Prize2016EarlySummber" %>
<%@page import="grails.util.Holders" %>
<!doctype html>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0" charset="utf-8" /> 
		<link rel="stylesheet" href="${resource(file:'css/event-2016-early-summer-body.css') }">
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
			function drawing() {
				var url = "${createLink(controller:'event2016EarlySummber', action:'callingInformation')}";
				document.location.href=url;
			}
		</script>
	</head>
<body class="zhu_bg">
<div class="zhu_title"><img src="${resource(file:'images/zhu_top_bg.jpg')}" alt=""></div>
<div class="zhu_text">
	<img src="${resource(file:'images/zhu_top_bg1.jpg')}" alt="">
	<div class="zhu_txt">
		${KeyedMessage.findByKey("Welcome-to-language").message }
	</div>
</div>
<div class="zhu_list">
	<div class="zhu_list_title">${KeyedMessage.findByKey("Welcome-to-language2").message }</div>
	<table cellspacing="0" cellpadding="0">
		<tr>
			<td>类别</td>
			<td>金额(元)</td>
			<td>数量</td>
			<td>奖品</td>
		</tr>
		<g:each in="${Prize2016EarlySummber.list() }" var="prize">
		<tr>
			<g:if test="${prize?.valuable }">
				<td>${prize?.name }</td>
				<td><g:formatNumber number="${prize?.amount }"/></td>
				<td>${prize?.quantity }</td>
				<td>${prize?.description }</td>
			</g:if>
		</tr>
		</g:each>
	</table>
	<div class="zhu_list_bott">${KeyedMessage.findByKey("Activity-intro").message }</div>
<input type="button" class="zhuli" value="戳我抽奖" onclick="drawing()">
</div>
<div class="zl_pm" style="margin-top: 30px;">
		<div class="zl_pm_tit"><span>活动规则</span></div>
		<ul class="pm_list1">
		${KeyedMessage.findByKey("Activity-rule").message }
		</ul>
		<div class="zl_pm_txt">${KeyedMessage.findByKey("Activity-rule2").message }</div>
</div>
<div class="zhuli_bot1">${KeyedMessage.findByKey("Activity-rule3").message }</div>
</body>
</html>