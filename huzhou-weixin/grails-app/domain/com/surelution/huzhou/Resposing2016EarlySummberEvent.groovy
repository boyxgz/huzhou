package com.surelution.huzhou

/**
 * 针对好友号召助力，所做的助力
 * @author <a href="mailto:guangzong.syu@gmail.com">guagnzong</a>
 *
 */
class Resposing2016EarlySummberEvent {

    static constraints = {
		subscriber(unique:'calling')
    }

	Subscriber subscriber
	Calling2016EarlySummberEvent calling
	Date dateCreated
}
