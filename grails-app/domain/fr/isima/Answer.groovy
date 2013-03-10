package fr.isima

class Answer extends Post {

  int getReputationVoteUp()   { 10 }
  int getReputationVoteDown() { -2 }
  int getReputationAccepted() { 15 }
  int getReputationVoter()    { -1 }
  int getReputationAcceptor() { 2 }

  static belongsTo = [question: Question]

  static constraints = {
  }
}
