package fr.isima

class Answer extends Post {

  static belongsTo = [question:Question]

  static constraints = {
  }
}
