package com.surelution.huzhou

import grails.util.Holders

import java.text.SimpleDateFormat

import org.junit.After;

import com.sun.jmx.snmp.Timestamp
import com.surelution.whistle.core.Auth2Util
import com.surelution.whistle.core.Auth2Util.AuthScope
import com.surelution.whistle.push.UserInfo
/**
 * 活动页面的总controller
 * @author <a href="mailto:guangzong.syu@gmail.com">guagnzong</a>
 *
 */
class Event2016EarlySummberController {
	
	private Subscriber subscriber

	def votingTopListService
	/**
	 * 自动登录
	 */
	def beforeInterceptor = {
		
		subscriber = Subscriber.get(1)
		def userSn = request.getCookie('subscriber-sn')
		
//		subscriber = SubscriberCookie.findBySubscriberSn(userSn)?.subscriber
		if(!subscriber) {
			def requestUrl = request.forwardURI
			def baseUrl = Holders.config.grails.serverURL
			def url = Auth2Util.buildRedirectUrl("${baseUrl}/autoLogin/login", requestUrl, AuthScope.BASE)
			response.deleteCookie('subscriber-sn')
			redirect(url:url)
			return false
		}
		return true
	}

	/**
	 * 显示助力页
	 * @return
	 */
    def calling(Long id) {
		def beneficiary = Subscriber.get(id)
		[beneficiary:beneficiary]
	}

	/**
	 * 活动引导页
	 * @return
	 */
	def intro(Long id) {
		def beneficiary = Subscriber.get(id)
		def callingShare = Calling2016EarlySummberEvent.findBySubscriber(beneficiary)
		def resposing = Resposing2016EarlySummberEvent.findBySubscriber(subscriber)
		
		/**
		 * 此处flash.messag没有触发
		 */
		if(resposing != null){
			flash.message = KeyedMessage.findByKey("There-are").message
				.replace("##",UserInfo.loadUserInfo(beneficiary.openId).nickname)
		}
		if(beneficiary && callingShare && resposing == null){
			resposing = new Resposing2016EarlySummberEvent()
			resposing.calling = callingShare
			resposing.subscriber = subscriber
			resposing.dateCreated = new Date()
			resposing.save(flush:true)
		}
		[beneficiary:beneficiary]
	}

	/**
	 * 我的“送你游”
	 * @return
	 */
	def dashboard() {
		def isDrawingSub = DrawingTicketSubscribing2016EarlySummber.findBySubscriber(subscriber)
		[isDrawingSub:isDrawingSub]
	}
	
	/**
	 * 抽奖页
	 * @return
	 */
	def drawing() {
		/**
		 * @return 分享的url
		 */
		def dest = "${Holders.config.grails.serverURL}/Event2016EarlySummber/calling/${subscriber.id}"
		def url = Auth2Util.buildRedirectUrl(dest, subscriber.openId, Auth2Util.AuthScope.BASE)
		
		/**
		 * @return 返回中奖记录
		 */
		DrawingTicket2016EarlySummber drawing = DrawingTicketSubscribing2016EarlySummber.findBySubscriber(subscriber)
		if(!drawing || drawing.isUse == true){
			drawing = DrawingTicketScanningQr2016EarlySummber.list()[0]
		}
		
		/**
		 * @return 抽奖的机会
		 */
		def ticketNum = DrawingTicket2016EarlySummber.findAllByIsUse(false).size()
		
		def lastDrawing = DrawingTicket2016EarlySummber.createCriteria().list{
			eq("subscriber",subscriber)
			order("dateCreated","desc")
		}
		
		Date lastDrawingDate
		Boolean isToday
		if(lastDrawing){
			lastDrawingDate = lastDrawing[0].dateCreated
			def today = new Date()
			today.setHours(0)
			today.setMinutes(0)
			today.setSeconds(0)
			//today.clearTime()清除时间
			SimpleDateFormat todaySDF = new SimpleDateFormat("yyyy-MM-dd HH:mm")
			isToday = todaySDF.format(today) < todaySDF.format(lastDrawingDate)
		}
		
		
		[url:url,lastDrawingDate:lastDrawingDate,isToday:isToday,drawing:drawing,ticketNum:ticketNum]
	}
	
	def useTicket(long id){
		def drawing = DrawingTicket2016EarlySummber.get(id)
		drawing?.isUse = true
		println drawing.drawAt
		drawing.drawAt = new Date()
		drawing.save(flush:true)
	}
	/**
	 * 助力情况,及其获奖情况页
	 * @return
	 */
	def callingInformation(){
		def drawingTicketSub = DrawingTicketSubscribing2016EarlySummber.findBySubscriber(subscriber)
		def drawingTicketSca = DrawingTicketScanningQr2016EarlySummber.createCriteria().list{
			createAlias ("prize", "p") 
			eq("p.valuable",true)
		}
		
		/**
		 * 好友助攻数
		 */
		def callingShare = Calling2016EarlySummberEvent.findBySubscriber(subscriber)
		def resposingNum = Resposing2016EarlySummberEvent.findAllByCalling(callingShare).size()
		/**
		 * 排名数
		 */
		def topAt = votingTopListService.topAt(resposingNum)
		println topAt
		[drawingTicketSca:drawingTicketSca,drawingTicketSub:drawingTicketSub,resposingNum:resposingNum,topAt:topAt]
	}
	
	def onMenuShareSuccess(Long id){
		def callingShare = Calling2016EarlySummberEvent.findBySubscriber(subscriber)
		if(!callingShare){
			callingShare = new Calling2016EarlySummberEvent()
			callingShare.subscriber = subscriber
			callingShare.dateCreated = new Date()
			callingShare.save(flush:true)
		}	
		redirect(action:'drawing')
	}
}
