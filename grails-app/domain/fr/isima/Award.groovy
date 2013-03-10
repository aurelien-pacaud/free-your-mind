package fr.isima

class Award {

  String title
  int bound = 0
  Tag tag
  AwardCategory category
  AwardType type

  static constraints = {
    title(nullable:false, maxSize:150, unique:true, blank:false)
    tag(nullable:true)
  }
}

enum AwardCategory{
  GOLD, SILVER, BRONZE, CHOCOLATE
}

enum  AwardType {
  REPUTATION, NB_QUESTIONS, NB_ANSWERS, NB_COMMENTS
}
