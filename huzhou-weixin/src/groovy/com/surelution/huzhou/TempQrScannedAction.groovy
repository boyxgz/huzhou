package com.surelution.huzhou

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.push.GroupInfo


class TempQrScannedAction extends HuzhouBaseAction {
	
	private TempQrCode code

	public boolean accept() {
		def qrId
		if(getParam("Event") == "subscribe") {
			return true
		} else if(getParam("Event") == "SCAN") {
			qrId = getParam("EventKey")
		}
		
		if(qrId) {
			def id = qrId as Integer
			if(TempQrCode.QR_ID_START_FROM <= id) {
				code = TempQrCode.findByQrKey(id)
			}
		}
		
		code != null
	}

	public void execute() {
		if(getParam("Event") == "subscribe"){
			def drawSub = DrawingTicketSubscribing2016EarlySummber.findBySubscriber(subscriber)
			if(!drawSub){
				put(new Attribute(Attribute.KEY_Content,"关注获得抽奖机会一次"))
				drawSub = new DrawingTicketSubscribing2016EarlySummber()
				drawSub.subscriber = subscriber
				drawSub.dateCreated = new Date()
				//此处分配奖品
				drawSub.prize = Prize2016EarlySummber.findByValuable(false)
				if(drawSub.prize.valuable == false){
					drawSub.winningSn = null
				}
				drawSub.save(flush:true)
			}
		}else if(getParam("Event") == "SCAN"){
			def drawScn = new DrawingTicketScanningQr2016EarlySummber()
			drawScn.subscriber = subscriber
			drawScn.dateCreated = new Date()
			drawScn.prize = Prize2016EarlySummber.findByValuable(false)
			if(drawScn.prize.valuable == false){
				drawScn.winningSn = null
			}
		}
	}

}
