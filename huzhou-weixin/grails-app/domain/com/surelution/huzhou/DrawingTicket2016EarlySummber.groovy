package com.surelution.huzhou

import org.apache.commons.lang3.RandomUtils

import com.sun.org.apache.xpath.internal.operations.Equals;

class DrawingTicket2016EarlySummber {

    static constraints = {
		winningSn nullable:true
		prize nullable:true
		drawAt nullable:true
		winningSn nullable:true
		winningSn unique:true
    }
	
	def afterInsert(){
		long l = id * 100
		l += RandomUtils.nextInt(0, 100)
		StringBuilder sb = new StringBuilder()
		
		String sl = l.toString()
		(8 - sl.length()).times {
			sb.append("0")
		}
		sb.append(sl)
		winningSn =  sb.toString()
	}
	
	Subscriber subscriber
	Date dateCreated
	Date drawAt
	Prize2016EarlySummber prize
	String winningSn
	Boolean isUse = false
	/**
	 * 是否已兑奖
	 */
	Boolean rewarded = false
	
	String getWellLookSn() {
		StringBuffer sb = new StringBuffer(winningSn)
		sb.insert(3, "-")
		sb.insert(7, "-")
		return sb.toString()
	}
}
