package com.surelution.huzhou

import java.util.Date;


class Subscriber {

    static constraints = {
		dateCreated nullable:true
    }
	
	static mapping = {
		openId unique:true
	}
	
	String openId
	Date dateCreated
}
