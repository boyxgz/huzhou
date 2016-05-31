<!doctype html>
<%@page import="com.surelution.whistle.push.UserInfo"%>
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
					<h3>&nbsp;&nbsp;&nbsp;助力排名报表</h3>
					<table class="table table-bordered table-respose">
						<thead>
							<tr>
								<td>排名</td>
								<td>助力数</td>
								<td>粉丝ID</td>
								<td>粉丝头像/昵称</td>
							</tr>
						</thead>
						<tbody>
							<g:each in="${top20 }" status="i" var="t">
							<tr>
								<td>${i+1 }</td>
								<td>${t[0] }</td>
								<g:set var="openId" value="${t[1].subscriber.openId }"/>
								<g:set var="ui" value="${UserInfo.loadUserInfo(openId) }"/>
								<td>${t[1].subscriber.id }</td>
								<td><img alt="" src="${ui.headImgUrl }" height="50" width="50">
								<br/>
								${ui.nickname }</td>
							</tr>
							</g:each>
						</tbody>
					</table>
					<br />
				</div>
			</div>	
		</div>
	</body>
</html>
