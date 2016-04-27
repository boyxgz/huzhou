package com.surelution.huzhou

import grails.util.Holders;

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute

class TempQrEvent2016EarlySummber extends TempQrCode {

    static constraints = {
		content nullable:true
		scannedBy nullable:true
		scannedAt nullable:true
		assignTo nullable:true
    }

	String content
	Subscriber scannedBy
	Date scannedAt
	GasStation assignTo

	public Attribute scaned(Subscriber subscriber) {
		if(scannedAt != null || scannedBy != null) { //被扫描过了的二维码，不能在扫描
			return new Attribute(Attribute.KEY_Content, KeyedMessage.findByKey("EVENT-2016-EARLY-SUMMER-QR-SCANNED-DUPLICATED")?.message)
		}
		def firstSightToday = new Date().clearTime()
		def todayScanned = TempQrEvent2016EarlySummber.createCriteria().get() {
			projections {
				count('id')
			}
			eq('scannedBy', subscriber)
			ge('scannedAt', firstSightToday)
		}
		if(todayScanned < 1) { //合法的扫描
			scannedAt = new Date()
			scannedBy = subscriber
			save(flush:true)

			def ticket = new DrawingTicketScanningQr2016EarlySummber()
			ticket.qrCode = this
			ticket.subscriber = subscriber
			ticket.save(flush:true)

			def attr = new NewsAttribute()
			attr.add(KeyedMessage.findByKey("EVENT-2016-EARLY-SUMMER-QR-SCANNED-TITLE")?.message, 
				KeyedMessage.findByKey("EVENT-2016-EARLY-SUMMER-QR-SCANNED-DESCRIPTION")?.message, 
				"${rootPath}/images/springsource.png", 
				"${rootPath}/event2016EarlySummber/drawing/${ticket.id}")
			return attr
		} else { //当天扫描超过一次
			return new Attribute(Attribute.KEY_Content, KeyedMessage.findByKey("EVENT-2016-EARLY-SUMMER-QR-SCANNED-MORE-THAN-ONCE-A-DAY")?.message)
		}
	}	
	
}
