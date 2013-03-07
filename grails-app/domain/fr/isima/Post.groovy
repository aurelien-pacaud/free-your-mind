package fr.isima

abstract class Post {

  String content
  Date lastEditionDate = new Date()
  Date creationDate = new Date()
  long mark = 0	
  boolean isAccepted = false
  int reputation = 0

  static belongsTo = [contributor: Contributor, editionContributor: Contributor]
  static hasMany = [comments: Comment, postHistories: PostHistory]

  static constraints = {
    content(nullable: false, blank: false)
  }

  static mapping = {
    content type: 'text'
    comments sort: 'creationDate'
  }
}
