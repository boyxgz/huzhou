<%@page import="com.surelution.whistle.push.UserInfo"%>
<!doctype>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<title>兑奖页面</title>
		<style>
			.box{margin-top:30px;}
		</style>
		<script type="text/javascript">
		$(document).ready(function(){
			$("#submit").click(function() {
				var url = "${createLink(action:'verifyWinningSn',controller:'convert')}?winningSn=" + $("#winningSn").val();
				$.ajax({
					url:url,
					dataType : "json",
					success : function(data){
						$("nikeName").val(data.nikeName);
						$("#name").val(data.name);
						$("#amount").val(data.amount);
						$("#description").val(data.description);
						$("#drawingAt").val(data.drawingAt);
						$("#ticket").val(data.id);
						if(data.rewarded == true){
							$("#rewarded").attr("checked",true)
							$("#confim").attr("disabled",true)
						}else if(data.rewarded == false){
							$("#rewarded").removeAttr("checked")
							$("#confim").removeAttr("disabled")
						}
						if(data.message != undefined){
							alert(data.message);
						}
					}
				});
			});

			$("#confim").click(function(){
				var url = "${createLink(action:'index',controller:'convert')} ?id=" + $("#ticket").val();
				window.location.href = url;
			});
		});
		</script>
	</head>
	<body>
		<div class="content-wrapper">
			<div class="container">
				<div class="box box-info"><br/><br/>
					<dl class="dl-horizontal">
						<dt><g:message code="index.winningSn.label" default="兑奖码"/></dt>
						<dd>
							<div class="col-md-4">
								<input type="text" class="form-control" name="winningSn" required="required" id="winningSn"/>
							</div>
						</dd>
					</dl>
					<input type="button" class="btn btn-primary" id="submit" value="查询" style="margin:15px;"/><br/>
					<span>
						<g:if test="${flash.message }">${flash.message }</g:if>
					</span>
				</div>
				<div class="box box-info"><br />
					<dl class="dl-horizontal">
						<dt><g:message code="index.nikename.label" default="NikeName"/></dt>
						<dd>
							<div class="col-md-4">
								<input type="text" class="form-control" id="nikeName" required="required" value="${UserInfo.loadUserInfo(ticket?.subscriber?.openId)?.nickname }"/>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt><g:message code="prize.name.label" default="Name"/></dt>
						<dd>
							<div class="col-md-4">
								<input type="text" class="form-control" id="name" />
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt><g:message code="prize.amount.label" default="Amount"/></dt>
						<dd>
							<div class="col-md-4">
								<input type="text" class="form-control" id="amount" />
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt><g:message code="prize.description.label" default="Description"/></dt>
						<dd>
							<div class="col-md-4">
								<input type="text" class="form-control" id="description" />
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt><g:message code="index.drawingAt.label" default="Drawing At"/></dt>
						<dd>
							<div class="col-md-4">
								<input type="text" class="form-control" id="drawingAt" />
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt><g:message code="index.rewarded.label" default="rewarded"/></dt>
						<dd><div class="col-md-4">
							<input type="checkbox" id="rewarded"/>
						</div></dd>
					</dl>
					<input type="hidden" id="ticket" />
					<input type="button" value="兑换" id="confim" class="btn btn-primary" style="margin:15px;" />
					<br/>
				</div>
			</div>
		</div>
	</body>
</html>