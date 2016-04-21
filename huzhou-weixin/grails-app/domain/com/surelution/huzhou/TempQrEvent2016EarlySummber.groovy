package com.surelution.huzhou

class TempQrEvent2016EarlySummber extends TempQrCode {

    static constraints = {
		scannedBy nullable:true
		scannedAt nullable:true
		assignTo nullable:true
    }
	
	Subscriber scannedBy
	Date scannedAt
	GasStation assignTo
}
