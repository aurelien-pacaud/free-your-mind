package fr.isima

class PostHistory {

	Date date
	PostType type
	
	static belongsTo = [contributor:Contributor, post:Post] 
	
    static constraints = {
		date(nullable:false)
		type(nullable:false)
    }
}

enum PostType{
	ASKED, ANSWERD, REVISION, ACCEPTED
}
