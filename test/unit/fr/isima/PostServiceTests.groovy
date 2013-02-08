package fr.isima

import com.google.protobuf.ServiceException


@TestFor(PostService)
@Mock([Contributor, Question, PostHistory])
class PostServiceTests {
	
	def service = new PostService()
	//def user = new Contributor(login: "Toto", password: "tttttttt")
		
	/**
	 *  Test Ok of create method.	
	 */
    void testCreateOk() {			
	
		assertTrue(true)			
    }
	
	/**
	 *  Test Fail of create method.
	 */
	void testCreateFail() {		
		
		assertTrue(true)
	}
	
	/**
	 *  Test of incMark method.
	 */
	void testIncMark() {
	
		def post = new Question(title: "Title", content: "Content test", contributor: user)
		service.incMark(post)
		
		assertEquals 1, Question.get(post.id).mark
	}
	
	/**
	 *  Test of downMark method.
	 */
	void testDownMark() {
	
		def post = new Question(title: "Title", content: "Content test", contributor: user, mark:1)
		service.downMark(post)
		
		assertEquals 0, Question.get(post.id).mark
	}
}
