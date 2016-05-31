package com.surelution.huzhou

class Event2016EarlySummberReportController {

    def index() { }

	def gainPrize() {
		def top20 = Resposing2016EarlySummberEvent.createCriteria().list(max:20){
			projections {
				countDistinct('subscriber', 'c')
				groupProperty('calling')
			}
			order("c","desc")
		}
		
		[top20:top20]
	}
}
