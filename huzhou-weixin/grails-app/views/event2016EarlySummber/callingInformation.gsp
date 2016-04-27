<%@page import="com.surelution.huzhou.KeyedMessage" %>
<%@page import="grails.util.Holders" %>
<!doctype html>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, user-scalable=no">
		<link rel="stylesheet" href="${resource(file:'css/bootstrap.min.css') }" type="text/css"/>
		<script type="text/javascript" src="${resource(file:'js/bootstrap.min.js') }"></script>
		<link rel="stylesheet" href="${resource(file:'css/myself.css') }" type="text/css" />
		<script type="text/javascript" src="${resource(file:'js/jquery.min.js') }"></script>
		<title>助力情况</title>
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
			});
		</script>
		<style>
			body{background-color:rgba(185, 205, 203, 0.47);}
			.table{text-align: center;}
			.delete{text-decoration:line-through;}
			.null{}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="col-xs-12 col-sm-12 box text-content">
				<g:if test="${resposingNum != 0 }">
				<p>${KeyedMessage.findByKey("Calling-Welcome").message.replace("##", resposingNum.toString()) }</p>
				</g:if>
				<g:else>
					<p>${KeyedMessage.findByKey("Ranking-Zero").message }</p>
				</g:else>
				<p>${KeyedMessage.findByKey("Ranking").message.replace("##", topAt.toString()) }</p>
				<p>${KeyedMessage.findByKey("Ranking-First").message.replace("##", "1") }</p>
				<p>${KeyedMessage.findByKey("Ranking-Last").message.replace("##", "1") }</p>
				<p style="color:red;">${KeyedMessage.findByKey("Push-Message").message }</p>
			</div>
			<table class="table table-bordered table-respose" >
				<thead><tr>
					<th style="width:14%; text-align:center;">序号</th>
					<th style="width:24%; text-align:center;" >抽奖时间</th>
					<th style="width:22%; text-align:center;">来源</th>
					<th style="width:22%; text-align:center;" >奖项</th>
					<th style="width:18%; text-align:center;" >操作</th>					
				</tr></thead>
				<tbody>
					<g:each in="${drawingTicket }" status="i" var="ticket">
						<tr class=" ${ticket?.rewarded ? 'delete' : 'null' }">
						<td>${i+1 }</td>
						<td><g:formatDate date="${ticket?.drawingAt }" format="MM/dd HH:mm"/>&nbsp;</td>
						<td>
							<g:if test="${ticket?.class == com.surelution.huzhou.DrawingTicketSubscribing2016EarlySummber }">关注</g:if>
							<g:else>扫码</g:else>
						</td>
						<td>
							<g:if test="${ticket?.prize?.name == "谢谢惠顾" }">
								未中奖
							</g:if>
							<g:else>${(ticket?.prize)? ticket.prize.name:"神秘" }</g:else>
						</td>
						<td>
							<g:if test="${ticket?.prize?.name != "谢谢惠顾" && ticket?.prize != null}">${ticket?.winningSn }</g:if>
							<g:elseif test="${ ticket?.prize == null && ticket?.drawingAt == null}">
								<g:link action="drawing" id="${ticket?.id }" class="btn btn-default">抽奖</g:link>
							</g:elseif>
							<g:else>谢谢惠顾</g:else>
						</td>	
					</tr></g:each>
					<tr>
						
					</tr>
				</tbody>
			</table>
		</div>
	</body>
</html>