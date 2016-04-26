package com.surelution.huzhou

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.push.GroupInfo


class TempQrScannedAction extends HuzhouBaseAction {
	
	private TempQrCode code

	public boolean accept() {
		Long qrKey
		if(getParam("MsgType") == "event") {
			if(getParam("Event") == "subscribe") {
				def key = getParam("EventKey")
				if(key?.startsWith("qrscene_")) {
					qrKey = key.substring("qrscene_".length()).toLong()
				}
			} else {
				if(getParam("Event") == "SCAN") {
					qrKey = getParam("EventKey").toLong()
				}
			}
		}
		if(qrKey) {
			code = TempQrCode.findByQrKey(qrKey)
		}
		code != null
	}

	public void execute() {
		def attr = code.scaned(subscriber)
		if(attr)
			put(attr)
		else
			keepSilence()
//		if(getParam("Event") == "subscribe"){
//			def drawSub = DrawingTicketSubscribing2016EarlySummber.findBySubscriber(subscriber)
//			if(!drawSub){
//				put(new Attribute(Attribute.KEY_Content,"关注获得抽奖机会一次"))
//				drawSub = new DrawingTicketSubscribing2016EarlySummber()
//				drawSub.subscriber = subscriber
//				drawSub.dateCreated = new Date()
//				//此处分配奖品
//				drawSub.prize = Prize2016EarlySummber.findByValuable(false)
//				if(drawSub.prize.valuable == false){
//					drawSub.winningSn = null
//				}
//				drawSub.save(flush:true)
//			}
//		}else if(getParam("Event") == "SCAN"){
//			def drawScn = new DrawingTicketScanningQr2016EarlySummber()
//			drawScn.subscriber = subscriber
//			drawScn.dateCreated = new Date()
//			drawScn.prize = Prize2016EarlySummber.findByValuable(false)
//			if(drawScn.prize.valuable == false){
//				drawScn.winningSn = null
//			}
//		}
	}

}
