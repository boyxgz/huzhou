/**
 * 
 */
package com.surelution.huzhou

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guagnzong</a>
 *
 */
class SilenceAction extends HuzhouBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	public boolean accept() {
		true
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	public void execute() {
		keepSilence()
	}

}
