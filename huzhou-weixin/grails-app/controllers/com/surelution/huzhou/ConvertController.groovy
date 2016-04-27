package com.surelution.huzhou

import com.surelution.whistle.push.UserInfo
import grails.converters.JSON
class ConvertController {

    def index() {
	}
	
	def verifyWinningSn(){
		def ticket = DrawingTicket2016EarlySummber.findByWinningSn(params.winningSn)
		def nickname = UserInfo.loadUserInfo(ticket?.subscriber?.openId).nickname
		def ticketJson = [
				nickname:nickname,
				name:ticket?.prize?.name,
				amount:ticket?.prize?.amount,
				description:ticket?.prize?.description,
				drawingAt:ticket?.drawingAt,
				rewarded:ticket?.rewarded ? true : false
			]
		render ticketJson as JSON
	}
}
