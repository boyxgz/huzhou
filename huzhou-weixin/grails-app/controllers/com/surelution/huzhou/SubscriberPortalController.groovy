package com.surelution.huzhou

import grails.converters.JSON
import grails.util.Holders

import com.surelution.whistle.core.Auth2Util
import com.surelution.whistle.core.TextCustomerServiceMessage
import com.surelution.whistle.core.Auth2Util.AuthScope
import com.surelution.whistle.push.UserInfo
class SubscriberPortalController {

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

    def index() {
		
	}
}
