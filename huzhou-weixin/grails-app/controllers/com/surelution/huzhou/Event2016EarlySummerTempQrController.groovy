package com.surelution.huzhou

import grails.util.Holders;

import com.surelution.whistle.push.qrcode.QrCode

class Event2016EarlySummerTempQrController {

	private static int A_MONTH_SECOND = 30 * 24 * 60 * 60

    def index() {
		def amount = params.int('amount')
		if(!amount) {
			amount = 0
		}
		amount.times {
			def qr = new TempQrEvent2016EarlySummber()
			qr.save()
		}
		render("${amount} Qr Code Created!")
	}
	
	def complete() {
		def qrs = TempQrEvent2016EarlySummber.findAllByContentIsNull()
		println qrs
		qrs.each {qr->
			def is = QrCode.getTempQr(qr.qrKey, A_MONTH_SECOND)
			def content = QrCode.decodeQr(is)
			def fos = new FileOutputStream("${Holders.config.qrFile.path}/${qr}.jpg")
			fos << is
			fos.flush()
			fos.close()
			qr.content = content
			qr.save()
		}
		render("${qrs.size()}")
	}
}
