package fr.isima

class AwardHistory {

	Date date
	
	static belongsTo = [award:Award , contributor:Contributor]
	
    static constraints = {
    }
}