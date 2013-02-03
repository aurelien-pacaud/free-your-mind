package fr.isima

import com.google.protobuf.ServiceException

@TestFor(PostService)
@Mock([Contributor, Question, PostHistory])
class PostServiceTests {
	
	def service = new PostService()
	def user = new Contributor(login: "Toto", password: "tttttttt")
	def postOk = new Question(title: "Title", content: "Content test", contributor: user)	
	def postFail = new Question(title: "Title", content: "Content test")
	
	/**
	 *  Test Ok of create method.	
	 */
    void testCreateOk() {			
	
		service.create(postOk)
		
		assertNotNull(Question.get(postOk.id))
		assertTrue(PostHistory.getAll().size() == 1)			
    }
	
	/**
	 *  Test Fail of create method.
	 */
	void testCreateFail() {
		shouldFail(ServiceException) {
			
			service.create(postFail)
		}
	}
}
