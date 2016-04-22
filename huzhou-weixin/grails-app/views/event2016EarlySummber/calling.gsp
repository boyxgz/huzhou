<%@page import="com.surelution.huzhou.KeyedMessage" %>
<%@page import="com.surelution.huzhou.Prize2016EarlySummber" %>
<%@page import="com.surelution.whistle.push.UserInfo"%>
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
			<div class="col-xs-12 col-sm-12" style="width:100%;height:150px; border:1px solid red; margin-top:20px;">
				<img alt="" src="">
				<p>活动宣传图片，建议加个大背景图片，然后，加些按钮能操作就OK了。</p>
			</div>
			<div class="col-xs-12 col-sm-12 box">
				<p class="text-content">${KeyedMessage.findByKey("Calling-Request")?.message?.replace("##",UserInfo.loadUserInfo(beneficiary?.openId)?.nickname) }</p>
				<g:link controller="Event2016EarlySummber" action="intro" id="${beneficiary?.id }" class="btn btn-info">助力</g:link>
			</div>
			<div class="col-xs-12 col-sm-12 box">
				<p class="text-content">${KeyedMessage.findByKey("Welcome-to-language")?.message }</p>
			</div>
		</div>
	</body>
</html>