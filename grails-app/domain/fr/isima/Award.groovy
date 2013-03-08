package fr.isima

class Award {
		
	String title
	String description
	int bound = 0
	Tag tag
	AwardCategory category
	AwardType type
	
    static constraints = {
		title(nullable:false, maxSize:150, unique:true, blank:false)
		description(nullable:false, blank:false)
		tag(nullable:true)
    }
	
	static scaffold = true
}

enum AwardCategory{
	GOLD, SILVER, BRONZE, CHOCOLATE
}

enum  AwardType {
	REPUTATION, NB_QUESTIONS, NB_ANSWERS, NB_COMMENTS
}