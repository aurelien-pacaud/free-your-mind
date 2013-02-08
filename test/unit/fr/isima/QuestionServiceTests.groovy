package fr.isima

@TestFor(QuestionService)
@Mock([Contributor, Question, PostHistory])
class QuestionServiceTests {

	def serviceQ = new QuestionService()
	def serviceP = new PostService()
	def user = new Contributor(login: "Toto", password: "tttttttt")
	def post = new Question(title: "Title", content: "Content test", contributor: user)
	
	/**
	 *  Test of incView method.
	 */
    void testIncView() {

		assertTrue true
    }
}
