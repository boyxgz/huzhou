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
		<title>${KeyedMessage.findByKey("intro-title").message }</title>
		<style>
			body{background-color:rgba(185, 205, 203, 0.47);}
			.text-content{text-align: center;}
		</style>
		
	</head>
	<body>
		<div class="container">
			<div class="col-xs-12 col-sm-12">
				<img alt="" src="">
			</div>
			<div class="col-xs-12 col-sm-12 box">
				<g:if test="${flash.message }">
					<p class="text-content">${KeyedMessage.findByKey("Congratulations").message }</p>
				</g:if>
				<g:else>
					<p class="text-content">${flash.message }</p>
				</g:else>
			</div>
		</div>
		<div class="container-fluid">
			<div class="col-xs-12 col-sm-12 box">
				<p class="text-content">${KeyedMessage.findByKey("Follow-Welcome").message }</p>
				<p style="text-align: center;"><img alt="中国石油湖州公司微信公众平台" src="${KeyedMessage.findByKey("Follow-Qr").message }" style="" class="img-responsive img-thumbnail" /></p>
			</div>
		</div>
	</body>
</html>