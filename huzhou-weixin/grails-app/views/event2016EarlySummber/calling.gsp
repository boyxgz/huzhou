<%@page import="grails.util.Holders"%>
<%@page import="com.surelution.huzhou.KeyedMessage" %>
<%@page import="com.surelution.huzhou.Prize2016EarlySummber" %>
<%@page import="com.surelution.whistle.push.UserInfo"%>
<!doctype html>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0" charset="utf-8" /> 
		<link rel="stylesheet" href="${resource(file:'css/event-2016-early-summer-body.css') }">
		<title>我要送你“游”</title>
		<script type="text/javascript">
			function zhuli() {
				var url = '${createLink(controller:'event2016EarlySummber', action:'intro', id:beneficiary?.id)}';
				document.location.href = url;
			}
		</script>
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
	</head>
	
	
<body class="fenxiang_bg">
	<img src="${resource(file:'images/fenxiang.png')}" alt="" class="fenxiang_img">
	<div class="fenxiang_txt">
	<g:set var="ui" value="${UserInfo.loadUserInfo(beneficiary?.openId) }"/>
		${KeyedMessage.findByKey("Calling-Request")?.message?.replace("##",ui?ui.nickname:'') }
	</div>
	<g:if test="${supported }"><input type="button" class="zhulihui" onclick="alert('你已经为该好友助力过，不能重复助力')" value="已为该好友助力过" ></g:if>
	<g:else><input type="button" class="zhuli" value="助力" onclick="zhuli()"></g:else>
	<div class="zhuli_bot">${KeyedMessage.findByKey("Welcome-to-language")?.message }</div>
</body>
</html>