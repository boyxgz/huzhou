package com.surelution.huzhou

import groovy.time.TimeCategory;

class DrawPrizeService {
	
	private final static Date PAID_END_AT = new Date(1427706000000l) //2015年3月30日17：00

	/**
	 * @param ticket
	 * @return
	 */
    def draw(DrawingTicket2016EarlySummber ticket) {
		if(ticket.prize) {
			return null
		}
		def maxPlayer = AppVar.findByKey("2016-early-summer-draw-prize-max-player-daily").value as Integer
		def lastDay = AppVar.findByKey("2016-early-summer-draw-prize-last-day-count").value as Integer
		def now = new Date()
		def firstSignt = now.clearTime()
		def firstSigntNextDay = new Date(firstSignt.time)
		use(TimeCategory) {
			firstSigntNextDay = firstSigntNextDay + 1.day
		}

		def batches = Prize2016EarlySummber.listOrderByIndex()
		def sn = ticket.id
		def prize
		batches.each {batch->
			def luckyNum = batch.luckyNum
			String[] _nums = luckyNum.split(",")
			
			def nums = []
			_nums.each() {n->
				try{
					int i = Integer.valueOf(n)
					nums.add(i)
				}catch (NumberFormatException e) {
				}
			}
			int factor = (sn -lastDay) % maxPlayer
			if(nums.contains(factor)) {
				def c = DrawingTicket2016EarlySummber.countByPrizeAndDrawingAtBetween(batch, firstSignt, firstSigntNextDay)
				if(c < batch.quantityPerDay) {
					prize = batch
				}
			}
		}
		if(!prize) {
			prize = Prize2016EarlySummber.findByValuable(false)
		}
		ticket.prize = prize
		ticket.drawingAt = now
		ticket.pointerAt = prize.pointerAt
		ticket.save(flush:true)
    }
	
}
