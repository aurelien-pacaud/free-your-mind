package fr.isima

import com.naleid.grails.MarkdownService;

import fr.isima.exception.PostException

/**
 * Service associated with Question.
 */
class QuestionService {

  def postService
  def awardService

  def save(Question question) {

    try {

      postService.save(question, PostType.ASKED)

      /* When the user post a question he gives 5 points. */
      question.contributor.reputation += 5
      
      /* Check award. */
      awardService.checkAward(question.contributor)
    }
    catch (e) {
      
      throw new PostException("Question can't be saved!")
    }
  }

  def update(Question question) {
    
    try {

      postService.update(question)
    }
    catch (e) {
      throw new PostException("Question can't be updated!")
    }
  }

  /**
   * Method use to update the number of view of a question.
   *
   * @param question Question to update.
   */
  def incViewCpt(Question question) {

    question.nbView++;
  }

  def lock(Question question) {
    question.isClosed = true;
  }
  
  def unlock(Question question) {
    question.isClosed = false;
  }
}
