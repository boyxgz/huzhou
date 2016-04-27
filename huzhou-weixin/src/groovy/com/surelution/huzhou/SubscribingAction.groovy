/**
 * 
 */
package com.surelution.huzhou

import com.surelution.whistle.core.Attribute

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guagnzong</a>
 *
 */
class SubscribingAction extends HuzhouBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	public boolean accept() {
		getParam("MsgType") == "event" && getParam("Event") == "subscribe"
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	public void execute() {
		put(new Attribute(Attribute.KEY_Content, KeyedMessage.findByKey("WELCOME-MESSAGE").message))
	}

}
