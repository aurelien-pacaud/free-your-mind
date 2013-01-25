package fr.isima

class PostHistory {

	Date date
	PostType type
	
	enum PostType{
		ASKED, ANSWERD, REVISION, ACCEPTED
	}
	
	static belongsTo = [contributor:Contributor, post:Post] 
	
    static constraints = {
    }
}