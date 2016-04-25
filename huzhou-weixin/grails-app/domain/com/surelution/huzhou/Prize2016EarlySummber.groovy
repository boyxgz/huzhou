package com.surelution.huzhou

class Prize2016EarlySummber {

    static constraints = {
		description nullable:true
		index nullable:true
    }
	static mapping = {
		index column:'_index'
	}
	String name
	Float amount

	/**
	 * 其实是没有中奖
	 * 是否有价值
	 */
	Boolean valuable = false
	String description
	//用来索引罗盘上的位置
	Integer index
}
