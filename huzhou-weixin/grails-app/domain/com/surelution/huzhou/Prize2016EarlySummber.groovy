package com.surelution.huzhou

class Prize2016EarlySummber {

    static constraints = {
		description nullable:true
    }
	
	String name
	Float amount

	/**
	 * 其实是没有中奖
	 */
	Boolean valuable = false
	String description
}
