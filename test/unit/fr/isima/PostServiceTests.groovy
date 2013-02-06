package fr.isima

import com.google.protobuf.ServiceException


@TestFor(PostService)
@Mock([Contributor, Question, PostHistory])
class PostServiceTests {
	
	def service = new PostService()
	def user = new Contributor(login: "Toto", password: "tttttttt")
		
	/**
	 *  Test Ok of create method.	
	 */
    void testCreateOk() {			
	
		def post = new Question(title: "Title", content: "Content test", contributor: user)
		service.create(post)
		
		assertNotNull(Question.get(post.id))
		assert PostHistory.getAll().size(), 1			
    }
	
	/**
	 *  Test Fail of create method.
	 */
	void testCreateFail() {		
		
		def post = new Question(title: "Title", content: "Content test")
		
		shouldFail(ServiceException) {
			
			service.create(post)
		}
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
