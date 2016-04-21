package com.surelution.huzhou

import grails.util.Holders
/**
 *   
 */

import com.surelution.whistle.core.Auth2Util

class AutoLoginController {

	/**
	 * logging
	 * @return
	 */
	def login() {
		def code = params.code
		def state = params.state
		
		def openId = Auth2Util.getOpenidByCode(code)
		def subscriber = Subscriber.findOrSaveByOpenId(openId)
		
		def sc = SubscriberCookie.populate(subscriber)
		response.setCookie('subscriber-sn', sc.subscriberSn)
		redirect(url:"http://${Holders.config.grails.serverURL}${state}")
	}
	
}
