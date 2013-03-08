package fr.isima

class Question extends Post {

  String title
  long nbView = 0
  boolean isClosed = false
  
  int getReputationVoteUp()   { 5 }
  int getReputationVoteDown() { 0 }
  
  static hasMany = [tags: Tag, answers: Answer]
  
  static constraints = {
    title(blank: false, nullable: false)
    tags(nullable: false, minSize: 1, maxSize: 5)
  }

  static mapping = {
    answers(sort: 'creationDate')
  }
}
