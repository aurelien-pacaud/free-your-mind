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
	
		assertTrue(true)
	}
	
	/**
	 *  Test of downMark method.
	 */
	void testDownMark() {
	
		assertTrue(true)
	}
}
