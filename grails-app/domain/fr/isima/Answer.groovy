package fr.isima

class Answer extends Post {

  int reputation = 5

  static belongsTo = [question:Question]

  static constraints = {
  }
}
