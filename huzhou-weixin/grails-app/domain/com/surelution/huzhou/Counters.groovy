package com.surelution.huzhou

import com.surelution.huzhou.exceptions.CountersException;


class Counters {

    static constraints = {
		key unique:true
    }
	
	static mapping = {
		key column:'_key'
		value column:'_value'
	}
	
	String key
	Integer value

	/**
	 * 利用gorm的乐观锁，如果更新到数据库的时候，出错表示在次同时，这行记录被其他线程修改，
	 * 就继续在数据库中再次加载，知道成功，或5次还取不到，就返回-1
	 * @param key
	 * @return
	 */
	public static Integer getNextValue(String key) throws CountersException {
		int tryTimes = 0
		while(tryTimes < 5) {
			tryTimes++
			def nv = lo(key)
			if(nv > 0) {
				return nv
			}
		}
		throw new CountersException()
	}

	private static Integer lo(String key) {
		def c = Counters.findByKey(key)
		if(!c) {
			c = new Counters()
			c.key = key
			c.value = 0
			c.save(flush:true)
		}
		def nv = c.value + 1
		c.value = nv
		c.save(flush:true)
		if(c.hasErrors()) {
			return -1
		} else {
			return nv
		}
	}
}
