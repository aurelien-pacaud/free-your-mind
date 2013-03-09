package fr.isima

class PostHistory {

  Date date = new Date()
  PostType type
  int reputation = 0

  static belongsTo = [contributor: Contributor, post: Post, award: Award] 

  static constraints = {
    date(nullable: false)
    type(nullable: false)
    post(nullable: true)
    award(nullable: true)
  }
  
  static mapping = {
    sort: 'date'
  }
}

enum PostType {
  ASKED, ANSWERED, REVISION, ACCEPTED, COMMENTED, VOTE_UP, VOTE_DOWN, REPUTATION, AWARD
}
