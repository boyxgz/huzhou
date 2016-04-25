package com.surelution.huzhou

class ReportController {

    def index() { }
	
	/**
	 * 中奖报表
	 * @param max
	 * @return
	 */
	def gainPrize(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		if(!params.offset) params.offset = 0
		params.sort = 'id'
		params.order = 'asc'
		def start
		def end
		if(params.startAt || params.endAt){
			start = params.date("startAt","yyyy-MM-dd")
			end = params.date("endAt","yyyy-MM-dd")
		}
		
		def isGainPrize = DrawingTicket2016EarlySummber.createCriteria().list(params){
			createAlias("prize", "p") 
			eq("p.valuable", true)
			if(start){
				ge("dateCreated",start)
			}
			if(end){
				le("dateCreated",end)
			}
		}
		
		def DrawingTicketTotal = DrawingTicket2016EarlySummber.createCriteria().list(){
			createAlias("prize", "p")
			eq ("p.valuable", true)
			if(start){
				ge("drawAt",start)
			}
			if(end){
				le("drawAt",end)
			}
		}.size()
		
		[isGainPrize:isGainPrize,DrawingTicketTotal:DrawingTicketTotal]
	}
	
	/**
	 * 兑奖报表
	 */
	def exchangePrize(Integer max){
		params.max = Math.min(max ?: 10, 100)
		if(!params.offset) params.offset = 0
		params.sort = 'id'
		params.order = 'asc'
		def start
		def end
		if(params.startAt || params.endAt){
			start = params.date("startAt","yyyy-MM-dd")
			end = params.date("endAt","yyyy-MM-dd")
		}
		
		def isGainPrize = DrawingTicket2016EarlySummber.createCriteria().list(params){
			createAlias("prize", "p")
			eq("p.valuable", true)
			eq("rewarded",true)
			if(start){
				ge("dateCreated",start)
			}
			if(end){
				le("dateCreated",end)
			}
		}
		
		def DrawingTicketTotal = DrawingTicket2016EarlySummber.createCriteria().list(){
			createAlias("prize", "p")
			eq ("p.valuable", true)
			eq("rewarded",true)
			if(start){
				ge("drawAt",start)
			}
			if(end){
				le("drawAt",end)
			}
		}.size()
		
		[isGainPrize:isGainPrize,DrawingTicketTotal:DrawingTicketTotal]
	}
}
