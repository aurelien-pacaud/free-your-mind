package fr.isima

class AwardHistory {

  Date date = new Date()

  static belongsTo = [award: Award, contributor: Contributor]

  static constraints = {
    date(nullable: false)
    award unique: 'contributor'
  }
}
