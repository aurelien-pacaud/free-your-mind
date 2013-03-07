package fr.isima

import com.naleid.grails.MarkdownService;

import fr.isima.exception.PostException

/**
 * Service associated with Question.
 */
class QuestionService {

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
