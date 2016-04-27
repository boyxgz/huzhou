package com.surelution.huzhou

import org.apache.commons.lang3.RandomUtils


import com.sun.org.apache.xpath.internal.operations.Equals;

/**
 * 抽奖券，已这个为准，表名用户有多少个抽奖机会。
 * @author Administrator
 *
 */
class DrawingTicket2016EarlySummber {

    static constraints = {
		winningSn nullable:true
		prize nullable:true
		drawingAt nullable:true
		winningSn nullable:true
		winningSn unique:true
		index nullabel:true
		pointerAt nullable:true
		user nullable:true
		rewaredAt nullable:true
    }
	
	static mapping = {
		index column:'_index'
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
	Date drawingAt
	Prize2016EarlySummber prize
	String winningSn
	Boolean isUse = false
	Integer pointerAt
	/**
	 * 是否已兑奖
	 */
	Boolean rewarded = false
	
	int index
	
	User user
	
	Date rewaredAt
	String getWellLookSn() {
		StringBuffer sb = new StringBuffer(winningSn)
		sb.insert(3, "-")
		sb.insert(7, "-")
		return sb.toString()
	}
}
