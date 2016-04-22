package com.surelution.huzhou

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.push.GroupInfo


class TempQrScannedAction extends HuzhouBaseAction {
	
	private TempQrCode code

	public boolean accept() {
		def qrId
		println qrId
		if(getParam("Event") == "subscribe") {
			def eventKey = getParam("EventKey")
			if(eventKey && eventKey.startsWith("qrscene_")) {
				qrId = eventKey.substring("qrscene_".length())
			}
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
		println code
	}

}
