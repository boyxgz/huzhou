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
		println 1
		def attr = code.scaned(subscriber)
		if(attr)
			put(attr)
		else
			keepSilence()
	}

}
