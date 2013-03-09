package fr.isima

class AwardHistoryService {

  def postHistoryService

  def createAwardHistory(Award award, Contributor user) {
      
    // Add the award only once
    def awardHistory = new AwardHistory(contributor: user, award: award)

    try {

      awardHistory.save(failOnError: true)
      log.info "Here"
      postHistoryService.createAwardHistory(user, award)
    } 
    catch (e) {
      log.error e
    }
  }
}
