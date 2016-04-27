package com.surelution.huzhou

import com.surelution.whistle.push.UserInfo
import grails.converters.JSON
class ConvertController {
	
	def springSecurityService
	
    def index(long id) {
		if(id){
			def ticket = DrawingTicket2016EarlySummber.get(id)
			ticket.rewarded = true
			ticket.user = springSecurityService.currentUser
			ticket.rewaredAt = new Date()
			if(ticket.save(flush:true)){
				flash.message = "兑奖成功！"
			}
		}
	}
	
	def verifyWinningSn(){
		def ticketJson = []
		def ticket = DrawingTicket2016EarlySummber.findByWinningSn(params.winningSn)
		println ticket
		if(!ticket){
			ticketJson = [message:KeyedMessage.findByKey("WinningSn-Null").message]
		}else if(ticket){
			def nickname = UserInfo.loadUserInfo(ticket?.subscriber?.openId).nickname
			def drawingAt = ticket?.drawingAt.format("yyyy-MM-dd")
			ticketJson = [
					nickname:nickname,
					name:ticket?.prize?.name,
					amount:ticket?.prize?.amount,
					description:ticket?.prize?.description,
					drawingAt:drawingAt,
					rewarded:ticket?.rewarded ? true : false,
					id :ticket?.id,
				]
		}
		println ticketJson as JSON
		render ticketJson as JSON
		
	}
	
}
