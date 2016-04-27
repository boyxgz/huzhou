package com.surelution.huzhou

class ReportController {
	
	def springSecurityService
	
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
				ge("drawingAt",start)
			}
			if(end){
				le("drawingAt",end)
			}
		}
		
		def DrawingTicketTotal = DrawingTicket2016EarlySummber.createCriteria().list(){
			createAlias("prize", "p")
			eq ("p.valuable", true)
			if(start){
				ge("drawingAt",start)
			}
			if(end){
				le("drawingAt",end)
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
		def admin = KeyedMessage.findByKey("admin").message
		def isGainPrize = DrawingTicket2016EarlySummber.createCriteria().list(params){
			createAlias("prize", "p")
			eq("p.valuable", true)
			eq("rewarded",true)
			if(springSecurityService.currentUser.username != admin){
				eq("user",springSecurityService.currentUser)
			}
			
			if(start){
				ge("rewaredAt",start)
			}
			if(end){
				le("rewaredAt",end)
			}
		}
		
		def DrawingTicketTotal = DrawingTicket2016EarlySummber.createCriteria().list(){
			createAlias("prize", "p")
			eq ("p.valuable", true)
			eq("rewarded",true)
			eq("user",springSecurityService.currentUser)
			if(start){
				ge("rewaredAt",start)
			}
			if(end){
				le("rewaredAt",end)
			}
		}.size()
		
		[isGainPrize:isGainPrize,DrawingTicketTotal:DrawingTicketTotal]
	}
	
	def scanningQr(){
		println params.startAt
		println params.endAt
		def startAt = params.startAt ? params.date("startAt","yyyy-MM-dd") : new Date(116,3,20)
		def endAt = params.endAt ? params.date("endAt","yyyy-MM-dd") : new Date(116,5,1)
		println startAt
		println endAt
		
		def gasStation = TempQrEvent2016EarlySummber.createCriteria().list {
			between("scannedAt", startAt, endAt)
			projections {
				groupProperty('assignTo')
				count("scannedBy")
			 }
			order("assignTo","desc")
		}
		println gasStation
		[gasStation:gasStation,startAt:startAt,endAt:endAt]
	}
}
