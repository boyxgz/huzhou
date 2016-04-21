package com.surelution.huzhou

import grails.util.Holders

import com.surelution.whistle.core.Auth2Util
import com.surelution.whistle.core.Auth2Util.AuthScope

/**
 * 活动页面的总controller
 * @author <a href="mailto:guangzong.syu@gmail.com">guagnzong</a>
 *
 */
class Event2016EarlySummberController {
	
	private Subscriber subscriber

	/**
	 * 自动登录
	 */
	def beforeInterceptor = {
		def userSn = request.getCookie('subscriber-sn')
		
		subscriber = SubscriberCookie.subscriberSn(userSn)?.subscriber
		if(!subscriber) {
			def requestUrl = request.forwardURI
			def baseUrl = Holders.config.grails.serverURL
			def url = Auth2Util.buildRedirectUrl("${baseUrl}/autoLogin/login", requestUrl, AuthScope.BASE)
			response.deleteCookie('subscriber-sn')
			redirect(url:url)
			return false
		}
		return true
	}

	/**
	 * 显示助力页
	 * @return
	 */
    def calling() {
		//test
	}

	/**
	 * 活动引导页
	 * @return
	 */
	def intro() {
		
	}

	/**
	 * 我的“送你游”
	 * @return
	 */
	def dashboard() {
		
	}
	
	/**
	 * 抽奖页
	 * @return
	 */
	def drawing() {
		
	}
}
