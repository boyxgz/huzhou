package com.surelution.huzhou

class Subscribing {

    static constraints = {
    }
	static mapping = {
		subscribingAtString formula: "DATE_FORMAT(subscribing_at, '%Y-%m-%d')"
	}
	
	Subscriber subscriber
	Date subscribingAt
	String comeFrom
	
	String subscribingAtString

}
