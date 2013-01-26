package fr.isima

class Award {
		
	String title
	String description
	int value = 0
	AwardType type;
	
    static constraints = {
		title(nullable:false, maxSize:150, unique:true)
		description(nullable:false)
		value(nullable:false)
    }
}

enum AwardType{
	GOLD, SILVER, BRONZE, CHOCOLATE
}