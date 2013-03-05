package fr.isima

class AwardHistoryService {

    def serviceMethod() {

    }
	
	def createAwardHistory(Award award, Contributor user) {
		
		// Add the award only once
		def history = AwardHistory.findAllByContributorAndAward(user,award)
		if(history == null || history.size == 0) {
			def awardHistory = new AwardHistory(contributor: user, award: award, date: new Date())	
			awardHistory.save()
		}
	  }
}
