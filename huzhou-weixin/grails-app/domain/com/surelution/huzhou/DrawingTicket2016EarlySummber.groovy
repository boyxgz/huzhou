package com.surelution.huzhou

class DrawingTicket2016EarlySummber {

    static constraints = {
		winningSn nullable:true
		prize nullable:true
    }
	
	Subscriber subscriber
	Date dateCreated
	Date drawAt
	Prize2016EarlySummber prize
	String winningSn
	
	/**
	 * 是否已兑奖
	 */
	Boolean rewarded = false
}
