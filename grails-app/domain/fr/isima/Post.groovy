package fr.isima

abstract class Post {

  String content
  Date lastEditionDate = new Date()
  Date creationDate = new Date()
  long mark = 0	
  boolean isAccepted = false

  int reputationVoteUp   = 0
  int reputationVoteDown = 0
  int reputationAccepted = 0
  int reputationVoter    = 0 
  int reputationAcceptor = 0

  static belongsTo = [contributor: Contributor, editionContributor: Contributor]
  static hasMany = [comments: Comment, postHistories: PostHistory]
  
  static transients = ['reputationVoteUp', 'reputationVoteDown', 'reputationAccepted', 'reputationVoter', 'reputationAcceptor']

  static constraints = {
    content(nullable: false, blank: false)
  }

  static mapping = {
    content type: 'text'
    comments sort: 'creationDate'
  }
}
