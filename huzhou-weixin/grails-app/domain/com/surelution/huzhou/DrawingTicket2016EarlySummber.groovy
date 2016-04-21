package com.surelution.huzhou

class DrawingTicket2016EarlySummber {

    static constraints = {
		winningSn nullable:true
    }
	
	Subscriber subscriber
	Date dateCreated
	Date drawAt
	Prize2016EarlySummber prize
	String winningSn
	Boolean rewarded = false
}
