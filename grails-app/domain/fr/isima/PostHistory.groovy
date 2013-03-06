package fr.isima

class PostHistory {

  Date date = new Date()
  PostType type

  static belongsTo = [contributor: Contributor, post: Post] 

  static constraints = {
    date(nullable:false)
    type(nullable:false)
  }
  
  static mapping = {
    sort: 'date'
  }
}

enum PostType {
  ASKED, ANSWERED, REVISION, ACCEPTED, COMMENTED, VOTE_UP, VOTE_DOWN
}
