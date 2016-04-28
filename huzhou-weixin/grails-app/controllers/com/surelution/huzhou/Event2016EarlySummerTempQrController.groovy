package com.surelution.huzhou

import grails.util.Holders;
import groovy.time.TimeCategory;

import com.surelution.huzhou.utils.CardGenerator;
import com.surelution.whistle.push.qrcode.QrCode

class Event2016EarlySummerTempQrController {

	private static int A_MONTH_SECOND = 30 * 24 * 60 * 60

    def index() {
		def start = System.currentTimeMillis()
		def amount = params.int('amount')
		if(!amount) {
			amount = 0
		}
		amount.times {
			def qr = new TempQrEvent2016EarlySummber()
			qr.save()
		}
		println System.currentTimeMillis() - start
		render("${amount} Qr Code Created!")
	}

	def complete() {
		def start = System.currentTimeMillis()
		def qrs = TempQrEvent2016EarlySummber.findAllByContentIsNull()
		qrs.each {qr->
			def is = QrCode.getTempQr(qr.qrKey, A_MONTH_SECOND)
			def filePath = "${Holders.config.qrFile.path}/${qr.qrKey}.jpg"
			def fos = new FileOutputStream(filePath)
			fos << is
			fos.flush()
			fos.close()
			is.close()
			//the inputstream from web does'nt support mark, 
			//so read the stream again from file system
			def content = QrCode.decodeQr(new FileInputStream(filePath))
			qr.content = content
			qr.save()
		}
		
		render("${qrs.size()} Use time: ${System.currentTimeMillis() - start}")
	}
	
	def generateQr() {
		def start = System.currentTimeMillis()
		int from = params.int('from')
		if(!from) {
			from = 9996
		}
		def amount = params.int('amount')
		if(!amount) {
			amount = 10005
		}
		for(int i = 0; i < amount / 6; i++) {
			CardGenerator.compositePage(6 * i + 1 + from, 6 * i + 7 + from, i + (int)(from/6));
		}
		render("${(int)(amount / 6)} use time: ${System.currentTimeMillis() - start}")
	}
//	
//	def test(){
//		def now = new Date()
//		println now.clearTime()
//		def nows = now.clearTime()
//		def nows1 = new Date(nows.time)
//		println nows1
//		use(TimeCategory){
//			nows1 = nows1 + 1.day
//		}
//		println nows1
//	}
}
