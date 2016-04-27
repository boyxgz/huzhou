package com.surelution.huzhou

/**
 * 每10分钟更新一次列表
 * @author <a herf="qiushemgming@sh-hansi.com"></a>
 *
 */
class VotingTopListService {

	/**
	 * 最近一次更新排名列表时间
	 */
    private long lastUpdate

	/**
	 * 排名列表更新周期
	 */
	private long updatePerid = 3600 // 10 minutes

	/**
	 * 排名列表 votingCounts
	 */
	private List<Integer> vcs

	/**
	 * 更新排名列表
	 */
	private synchronized List<Integer> getVotingCounts() {
		if(System.currentTimeMillis() - lastUpdate > updatePerid) {
			def vCri = Resposing2016EarlySummberEvent.createCriteria()
			def c = vCri.list {
				projections {
					groupProperty('calling')
					count("subscriber", "sub")
				 }
				order("sub","desc")
			}
			vcs = c.collect() {
				it[1]
			}
			lastUpdate = System.currentTimeMillis()
		}
		return vcs
	}

	/**
	 * 
	 * @param 助力数
	 * @return 排名
	 */
	def int topAt(int votes) {
		int position = 1
		for(int i : getVotingCounts()) {
			if(i <= votes) {
				break;
			}
			position++
		}
		return position
	}

	/**
	 * 
	 * @param 排名
	 * @return 助力数
	 */
	def int howManyVotes(int topAt) {
		def votes = 0
		def vcs = getVotingCounts()
		if(vcs?.size() >= topAt - 1) {
			votes = vcs[topAt - 1]
		}
		return votes
	}
}
