package fr.isima

import com.naleid.grails.MarkdownService;

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

    if (question != null) {

      question.nbView++;
      question.save()
    }
  }

  /**
   * Method use to lock a question.
   *
   * @param question Question to lock.
   */
  def lock(Question question) {

    if (question!= null) {

      question.isClosed = true;
      question.save()
    }
  }

  /**
   * Method use to unlock a question.
   *
   * @param question Question to unlock.
   */  
  def unlock(Question question) {

    if (question != null) {

      question.isClosed = false;
      question.save()
    }
  }
}
