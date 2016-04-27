<%@page import = "grails.util.Holders" %>
<%@page import = "com.surelution.huzhou.KeyedMessage" %>
<%@page import = "com.surelution.huzhou.DrawingTicket2016EarlySummber" %>
<!doctype html>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="width=device-width, user-scalable=no">
		<link rel="stylesheet" href="${resource(file:'css/bootstrap.min.css') }"/>
		<link rel="stylesheet" href="${resource(file:'css/rotarytable.css') }" />
		<script type="text/javascript" src="${resource(file:'js/jquery.min.js') }"></script>
		<script type="text/javascript" src="${resource(file:'js/bootstrap.min.js') }"></script>
		<script type="text/javascript" src="${resource(file:'js/awardRotate.js') }"></script>
		<title>抽奖页</title>
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
		<style>
			body{background-color:red;}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<div style="max-width:600px; margin:0 auto; margin-top:10%;">
						<img src="${resource(file:'images/1.png') }" id="shan-img" style="display:none;" />
						<img src="${resource(file:'images/2.png') }" id="sorry-img" style="display:none;" />
						<div class="banner">
							<div class="turnplate" style="background-image:url(${resource(file:'images/turnplate-bg.png')});background-size:100% 100%;">
								<canvas class="item" id="wheelcanvas" width="422px" height="422px"></canvas>
								<img class="pointer" src="${resource(file:'images/turnplate-pointer.png') }" />
							</div>
						</div>
				    </div>
				</div>
				<%--<div class="col-xs-12 col-sm-12">
					<p>查看助力情况按钮</p>
				</div>
				<div class="col-xs-12 col-sm-12">
					抽奖情况显示的内容
				</div>--%>
				<div class="col-xs-12 col-sm-12">
					<p id="pPrize" style="text-align: center; color:#fff; font-size:20px; line-height:50px;"></p>
				</div>
				<div class="col-xs-12 col-sm-12" style="position:relative; left:30%;">
					<g:link class="btn btn-default" action="callingInformation"  >查看抽奖情况</g:link> 
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		var drawn = ${ticket.drawingAt != null};
		//var drawn = false;
		var turnplate={
				restaraunts:[],				//大转盘奖品名称
				colors:[],					//大转盘奖品区块对应背景颜色
				outsideRadius:192,			//大转盘外圆的半径
				textRadius:155,				//大转盘奖品位置距离圆心的距离
				insideRadius:68,			//大转盘内圆的半径
				startAngle:0,				//开始角度
				bRotate:false				//false:停止;ture:旋转
		};
		var rotateTimeOut = function (){
			$('#wheelcanvas').rotate({
				angle:0,
				animateTo:2160,
				duration:8000,
				callback:function (){
					alert('网络超时，请检查您的网络设置！');
				}
			});
		};
	
		//旋转转盘 item:奖品位置; txt：提示语;
		var rotateFn = function (item, txt, wardSn){
			var angles = item * (360 / turnplate.restaraunts.length) - (360 / (turnplate.restaraunts.length*2));
			if(angles<270){
				angles = 270 - angles; 
			}else{
				angles = 360 - angles + 270;
			}
			$('#wheelcanvas').stopRotate();
			$('#wheelcanvas').rotate({
				angle:0,
				animateTo:angles+1800,
				duration:8000,
				callback:function (){
					if(txt != "谢谢惠顾"){
						txt = "恭喜您获得" + txt;
						txt += "<br/>中奖码：";
						txt += wardSn;
						}
					
					$("#pPrize").html(txt);
					turnplate.bRotate = !turnplate.bRotate;
				}
			});
		};

		function rotatePlate() {
			if(turnplate.bRotate)return;
			turnplate.bRotate = !turnplate.bRotate;

			if(${isToday}){
				
			}
			//TODO
			var url = "${createLink(action:'useTicket',controller:'event2016EarlySummber',id:ticket?.id)}";
			//获取随机数(奖品个数范围内),再此处决定选中那个奖品
			//var item = rnd(1,turnplate.restaraunts.length);
			var item, wardSn;				
			$.ajax({
				url:url,
				dataType : "json",
				success : function(data){
					item = data.abc;
					wardSn = data.wardSn
					//奖品数量等于10,指针落在对应奖品区域的中心角度[252, 216, 180, 144, 108, 72, 36, 360, 324, 288]
					rotateFn(item, turnplate.restaraunts[item-1], wardSn);
					drawn = true
					/* switch (item) {
						case 1:
							rotateFn(252, turnplate.restaraunts[0]);
							break;
						case 2:
							rotateFn(216, turnplate.restaraunts[1]);
							break;
						case 3:
							rotateFn(180, turnplate.restaraunts[2]);
							break;
						case 4:
							rotateFn(144, turnplate.restaraunts[3]);
							break;
						case 5:
							rotateFn(108, turnplate.restaraunts[4]);
							break;
						case 6:
							rotateFn(72, turnplate.restaraunts[5]);
							break;
						case 7:
							rotateFn(36, turnplate.restaraunts[6]);
							break;
						case 8:
							rotateFn(360, turnplate.restaraunts[7]);
							break;
						case 9:
							rotateFn(324, turnplate.restaraunts[8]);
							break;
						case 10:
							rotateFn(288, turnplate.restaraunts[9]);
							break;
					} */
					console.log(item);
				
				}
			});
		}
		
		$(document).ready(function(){
			//动态添加大转盘的奖品与奖品区域背景颜色
			turnplate.restaraunts = ["388元油卡充值", "谢谢惠顾", "188元油卡充值", "谢谢惠顾", "88元油卡充值", "谢谢惠顾", "38元油卡充值 ", "谢谢惠顾", "价值5元便利店商品", "谢谢惠顾"];
			turnplate.colors = ["#FFF4D6", "#FFFFFF", "#FFF4D6", "#FFFFFF","#FFF4D6", "#FFFFFF", "#FFF4D6", "#FFFFFF","#FFF4D6", "#FFFFFF"];
		
			$('.pointer').click(function() {
				if(drawn) {
					alert("您已经抽奖过，不能重复抽奖");
					return;
				}
				rotatePlate();
			} );
			if(drawn) {
				rotatePlate();
			}
		});
		
		//页面所有元素加载完毕后执行drawRouletteWheel()方法对转盘进行渲染
		window.onload=function(){
			drawRouletteWheel();
			if(${ticket?.prize != null}){
				console.log(${ticket?.pointerAt});
			}
		};
		
		function drawRouletteWheel() {    
		  var canvas = document.getElementById("wheelcanvas");    
		  if (canvas.getContext) {
			  //根据奖品个数计算圆周角度
			  var arc = Math.PI / (turnplate.restaraunts.length/2);
			  var ctx = canvas.getContext("2d");
			  //在给定矩形内清空一个矩形
			  ctx.clearRect(0,0,422,422);
			  //strokeStyle 属性设置或返回用于笔触的颜色、渐变或模式  
			  ctx.strokeStyle = "#FFBE04";
			  //font 属性设置或返回画布上文本内容的当前字体属性
			  ctx.font = '16px Microsoft YaHei';      
			  for(var i = 0; i < turnplate.restaraunts.length; i++) {       
				  var angle = turnplate.startAngle + i * arc;
				  ctx.fillStyle = turnplate.colors[i];
				  ctx.beginPath();
				  //arc(x,y,r,起始角,结束角,绘制方向) 方法创建弧/曲线（用于创建圆或部分圆）    
				  ctx.arc(211, 211, turnplate.outsideRadius, angle, angle + arc, false);    
				  ctx.arc(211, 211, turnplate.insideRadius, angle + arc, angle, true);
				  ctx.stroke();  
				  ctx.fill();
				  //锁画布(为了保存之前的画布状态)
				  ctx.save();   
				  
				  //----绘制奖品开始----
				  ctx.fillStyle = "#E5302F";
				  var text = turnplate.restaraunts[i];
				  var line_height = 17;
				  //translate方法重新映射画布上的 (0,0) 位置
				  ctx.translate(211 + Math.cos(angle + arc / 2) * turnplate.textRadius, 211 + Math.sin(angle + arc / 2) * turnplate.textRadius);
				  
				  //rotate方法旋转当前的绘图
				  ctx.rotate(angle + arc / 2 + Math.PI / 2);
				  
				  /** 下面代码根据奖品类型、奖品名称长度渲染不同效果，如字体、颜色、图片效果。(具体根据实际情况改变) **/
				  if(text.indexOf("M")>0){//流量包
					  var texts = text.split("M");
					  for(var j = 0; j<texts.length; j++){
						  ctx.font = j == 0?'bold 20px Microsoft YaHei':'16px Microsoft YaHei';
						  if(j == 0){
							  ctx.fillText(texts[j]+"M", -ctx.measureText(texts[j]+"M").width / 2, j * line_height);
						  }else{
							  ctx.fillText(texts[j], -ctx.measureText(texts[j]).width / 2, j * line_height);
						  }
					  }
				  }else if(text.indexOf("M") == -1 && text.length>6){//奖品名称长度超过一定范围 
					  text = text.substring(0,6)+"||"+text.substring(6);
					  var texts = text.split("||");
					  for(var j = 0; j<texts.length; j++){
						  ctx.fillText(texts[j], -ctx.measureText(texts[j]).width / 2, j * line_height);
					  }
				  }else{
					  //在画布上绘制填色的文本。文本的默认颜色是黑色
					  //measureText()方法返回包含一个对象，该对象包含以像素计的指定字体宽度
					  ctx.fillText(text, -ctx.measureText(text).width / 2, 0);
				  }
				  
				  //添加对应图标
				  if(text.indexOf("闪币")>0){
					  var img= document.getElementById("shan-img");
					  img.onload=function(){  
						  ctx.drawImage(img,-15,10);      
					  }; 
					  ctx.drawImage(img,-15,10);  
				  }else if(text.indexOf("谢谢参与")>=0){
					  var img= document.getElementById("sorry-img");
					  img.onload=function(){  
						  ctx.drawImage(img,-15,10);      
					  };  
					  ctx.drawImage(img,-15,10);  
				  }
				  //把当前画布返回（调整）到上一个save()状态之前 
				  ctx.restore();
				  //----绘制奖品结束----
			  }     
		  } 
		}
		
		</script>
</html>