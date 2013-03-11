package fr.isima

class AwardHistoryService {

  def postHistoryService

  /**
   *  Method to add a new award to a user.
   */
  def createAwardHistory(Award award, Contributor user) {
      
    def awardHistory = new AwardHistory(contributor: user, award: award)

    // Add the award only once
    if (awardHistory.validate()) {

      awardHistory.save()
      postHistoryService.createAwardHistory(user, award)
    }
  }
}
