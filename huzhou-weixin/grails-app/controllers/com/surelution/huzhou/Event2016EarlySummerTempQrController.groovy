package com.surelution.huzhou

import grails.util.Holders;
import groovy.time.TimeCategory;

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
			def filePath = "${Holders.config.qrFile.path}/${qr.qrKey}.jpg"
			def fos = new FileOutputStream(filePath)
			fos << is
			fos.flush()
			fos.close()
			//the inputstream from web does'nt support mark, 
			//so read the stream again from file system
			def content = QrCode.decodeQr(new FileInputStream(filePath))
			qr.content = content
			qr.save()
		}
		render("${qrs.size()}")
	}
	
	def test(){
		def now = new Date()
		println now.clearTime()
		def nows = now.clearTime()
		def nows1 = new Date(nows.time)
		println nows1
		use(TimeCategory){
			nows1 = nows1 + 1.day
		}
		println nows1
	}
}
