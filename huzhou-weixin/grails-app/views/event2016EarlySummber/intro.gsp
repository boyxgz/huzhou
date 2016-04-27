<%@page import="com.surelution.huzhou.KeyedMessage" %>
<!doctype html>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0" charset="utf-8" /> 
		<link rel="stylesheet" href="${resource(file:'css/event-2016-early-summer-body.css') }">
		<title>${KeyedMessage.findByKey("intro-title").message }</title>
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
<body class="index_bg">
<div class="head"><img src="${resource(file:'images/title.png')}" alt="" class="center"></div>
<div class="head_txt">长按识别下方二维码，关注“<span>中国石油湖州公司</span>”微信号，您也有机会获得388元大奖，祝您好运！</div>
<img src="${resource(file:'images/code_img.jpg')}" alt="" class="code_img">
</body>
</html>