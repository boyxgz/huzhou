<%@page import="com.surelution.whistle.push.UserInfo"%>
<!doctype>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<title>兑奖页面</title>
		<style>
			.box{margin-top:30px;}
			.content-form{margin-top:30px;}
		</style>
		<script type="text/javascript">
			$("#submit").click({
				var winningSn = $("#winningSn").val();
				alert(winningSn);
				var url = "${createLink(action:'convert',controller:'convert')}?winningSn=" ;
				alert(url)
				$.ajax({
					url:url,
					dataType : "json",
					success : function(data){
						if(data == false){
							alert(data);
							$("#name").val(data.name);
							
						}else{
						}
					}
				});
			});
		</script>
	</head>
	<body>
		<div class="content-wrapper">
			<div class="container">
				<div class="box box-info">
					<div class="content-form">
						<dl class="dl-horizontal">
							<dt><g:message code="index.winningSn.label" default="兑奖码"/></dt>
							<dd>
								<div class="col-md-4">
									<input type="text" class="form-control" name="winningSn" required="required" id="winningSn"/>
								</div>
							</dd>
						</dl>
						<input type="button" class="btn btn-primary" id="subMit" value="查询"/>
					</div>
					<div class="box box-info">
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
					</div>
					<br/>
				</div>
			</div>
		</div>
	</body>
</html>