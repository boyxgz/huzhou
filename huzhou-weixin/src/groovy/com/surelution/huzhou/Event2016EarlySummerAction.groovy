/**
 * 
 */
package com.surelution.huzhou

import com.surelution.whistle.core.Attribute

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guagnzong</a>
 *
 */
class Event2016EarlySummerAction extends HuzhouBaseAction {
	
	private Long qrKey

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	public boolean accept() {
		if(getParam("MsgType") == "event") {
			if(getParam("Event") == "subscribe") {
				def key = getParam("EventKey")
				if(key?.startsWith("qrscene_")) {
					qrKey = key.substring("qrscene_".length()).toLong()
					return true
				}
			} else {
				if(getParam("Event") == "SCAN") {
					qrKey = getParam("EventKey").toLong()
					return true
				}
			}
		}
		return false
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	public void execute() {
		put(new Attribute(Attribute.KEY_Content, "Your key is :${qrKey}"))
	}

}
