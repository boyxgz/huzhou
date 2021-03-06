package com.surelution.huzhou

import grails.converters.JSON
import grails.util.Holders

import java.text.SimpleDateFormat

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
	def drawPrizeService
	
	/**
	 * 自动登录
	 */
	def beforeInterceptor = {
		def userSn = request.getCookie('subscriber-sn')
//		subscriber = Subscriber.get(2)
		subscriber = SubscriberCookie.findBySubscriberSn(userSn)?.subscriber
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
		def c = Calling2016EarlySummberEvent.findOrSaveBySubscriber(beneficiary)
		
		//是否已经为这名用户助力过
		def supported = Resposing2016EarlySummberEvent.findByCallingAndSubscriber(c, subscriber) != null
		[beneficiary:beneficiary, supported:supported]
	}

	/**
	 * 活动引导页
	 * @return
	 */
	def intro(Long id) {
		def supported = true
		def beneficiary = Subscriber.get(id)
		def callingShare = Calling2016EarlySummberEvent.findOrSaveBySubscriber(beneficiary)
		def resposing = Resposing2016EarlySummberEvent.findByCallingAndSubscriber(callingShare, subscriber)
		if(AppVar.findByKey("2016-early-summer-draw-prize-on")?.value == 1) {
			if(resposing == null) {
				supported = false
				resposing = new Resposing2016EarlySummberEvent()
				resposing.calling = callingShare
				resposing.subscriber = subscriber
				resposing.save(flush:true)
			}
		}
		
		/**
		 * 此处flash.messag没有触发
		 */
		if(resposing != null){
			flash.message = KeyedMessage.findByKey("There-are").message
				.replace("##",UserInfo.loadUserInfo(beneficiary.openId).nickname)
		}
		def dest = "${Holders.config.grails.serverURL}/Event2016EarlySummber/calling/${subscriber.id}"
		[beneficiary:beneficiary, url:dest]
	}

	/**
	 * 我的“送你游”
	 * @return
	 */
	def dashboard() {
		def isDrawingSub = DrawingTicketSubscribing2016EarlySummber.findBySubscriber(subscriber)
		if(!isDrawingSub){
			isDrawingSub = new DrawingTicketSubscribing2016EarlySummber()
			isDrawingSub.subscriber = subscriber
			isDrawingSub.dateCreated = new Date()
			isDrawingSub.save(flush:true)
		}
		def dest = "${Holders.config.grails.serverURL}/Event2016EarlySummber/calling/${subscriber.id}"
		[isDrawingSub:isDrawingSub,url:dest]
	}
	
	/**
	 * 抽奖页
	 * @return
	 */
	def drawing(Long id) {
		DrawingTicket2016EarlySummber ticket
		if(id){
			ticket = DrawingTicket2016EarlySummber.get(id)
			if(ticket?.subscriber.id != subscriber.id) {
				//TODO 非法的抽奖
			}
		}
		
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
		
		def dest = "${Holders.config.grails.serverURL}/Event2016EarlySummber/calling/${subscriber.id}"
		[url:dest,lastDrawingDate:lastDrawingDate,isToday:isToday,ticketNum:ticketNum, ticket:ticket]
	}
	
	def useTicket(long id){
		println id
		def drawing = DrawingTicket2016EarlySummber.get(id)
		println drawing
//		println drawing
//		drawing?.isUse = true
//		drawing?.drawingAt = new Date()
//		drawing.save(flush:true)
		drawPrizeService.draw(drawing)
		def a = [abc:drawing.pointerAt, wardSn:drawing.wellLookSn]
		render a as JSON
	}
	/**
	 * 助力情况,及其获奖情况页
	 * @return
	 */
	def callingInformation(){
		DrawingTicketSubscribing2016EarlySummber.findOrSaveBySubscriber(subscriber)
		def ticket = DrawingTicket2016EarlySummber.createCriteria().list{
			eq("subscriber",subscriber)
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
		def	fistAt = votingTopListService.howManyVotes(1)
		def lastAt = votingTopListService.howManyVotes(20)
		def dest = "${Holders.config.grails.serverURL}/event2016EarlySummber/calling/${subscriber.id}"
		[drawingTicket:ticket,resposingNum:resposingNum,topAt:topAt,url:dest,fistAt:fistAt,lastAt:lastAt]
	}
}
