<%@page import="com.surelution.huzhou.KeyedMessage" %>
<%@page import="grails.util.Holders" %>
<!doctype html>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0" charset="utf-8" /> 
		<link rel="stylesheet" href="${resource(file:'css/event-2016-early-summer-body.css') }">
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
	</head>
	<body class="fenxiang_bg">
	<div class="zl_txt">
		<g:if test="${resposingNum != 0 }">
			<p>${KeyedMessage.findByKey("Calling-Welcome").message.replace("##", resposingNum.toString()) }</p>
		</g:if>
		<g:else>
			<p>${KeyedMessage.findByKey("Ranking-Zero").message }</p>
		</g:else>
	</div>
	<div class="zl_pm">
		<div class="zl_pm_tit">${KeyedMessage.findByKey("Ranking").message.replace("##", topAt.toString()) }</div>
		<ul class="pm_list">
			<li>${KeyedMessage.findByKey("Ranking-First").message.replace("##", fistAt.toString()) }</li>
			<li>${KeyedMessage.findByKey("Ranking-Last").message.replace("##", lastAt.toString()) }</li>
		</ul>
		<div class="zl_pm_txt">${KeyedMessage.findByKey("Push-Message").message }</div>
	</div>
	<div class="zl_pm1">
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td>序号</td>
				<td>抽奖时间</td>
				<td>来源</td>
				<td>奖项</td>
				<td>操作</td>
			</tr>
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
							<g:if test="${ticket?.prize?.name != "谢谢惠顾" && ticket?.prize != null}"><span>${ticket?.winningSn }</span></g:if>
							<g:elseif test="${ ticket?.prize == null && ticket?.drawingAt == null}">
								<g:link action="drawing" id="${ticket?.id }" class="btn btn-default">抽奖</g:link>
							</g:elseif>
							<g:else>谢谢惠顾</g:else>
						</td>	
					</tr>
				</g:each>
		</table>
		</div>
	</body>
</html>