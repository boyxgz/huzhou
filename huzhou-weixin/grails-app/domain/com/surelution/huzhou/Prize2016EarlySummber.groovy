package com.surelution.huzhou

import org.apache.commons.lang3.RandomUtils

class Prize2016EarlySummber {

    static constraints = {
		description nullable:true
    }
	static mapping = {
		index column:'_index'
	}
	
	static transients = ['pointerAt']
	
	String name

	/**
	 * 金额
	 */
	Float amount

	/**
	 * 
	 * 是否有价值，如果为false其实是没有中奖
	 */
	Boolean valuable = false
	String description

	/**
	 * 查找奖品的顺序，通常是由奖品的价值高低来决定，价值越高的数值越大
	 */
	Integer index
	
	/**
	 * 中奖的幸运数字
	 */
	String luckyNum
	
	/**
	 * 奖品总数
	 */
	Integer quantity
	
	/**
	 * 当天多少个
	 */
	Integer quantityPerDay
	
	/**
	 * 大转盘中奖品所在的指针位置
	 */
	String positions
	
	Integer getPointerAt() {
		String[] ps = positions.split(",")
		int length = ps.length
		int i = RandomUtils.nextInt(0, length)
		return ps[i].trim().toInteger()
	}
}
