package com.surelution.huzhou

/**
 * 每10分钟更新一次列表
 * @author <a herf="qiushemgming@sh-hansi.com"></a>
 *
 */
class VotingTopListService {

    private long lastUpdate
	
	private long updatePerid = 3600 // 10 minutes
	
	private List<Integer> votingCounts
	
	private synchronized void updateList() {
		def vCri = Resposing2016EarlySummberEvent.createCriteria()
		println vCri
		def c = vCri.list {
			projections {
				groupProperty('calling')
				sum("subscriber", "sub")
//				countDistinct("voterOpenId", "vc")
			 }
			order("sub","desc")
		}
		println c
		votingCounts = c.collect() {
			it[1]
		}
		lastUpdate = System.currentTimeMillis()
	}
	
	def int topAt(int value) {
		println value
		if(System.currentTimeMillis() - lastUpdate > updatePerid) {
			updateList()
		}
		println votingCounts
		int position = 0
		for(int i : votingCounts) {
			if(i < value) {
				position
				break;
			}
			position++
		}
		println position
		return position
	}
}
