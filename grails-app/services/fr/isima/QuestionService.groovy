package fr.isima

import com.naleid.grails.MarkdownService;

import fr.isima.exception.PostException

/**
 * Service associated with Question.
 */
class QuestionService {

  def postHistoryService

  def save(Question question) {

    /* If the question can't be saved. */
    if (!question.validate()) {

      throw new PostException("Post can't be saved");
    }
    else {
      
      def id = question.id
      question.save();

      if (id == null)
        postHistoryService.createAskedHistory(question, question.contributor)
      else
        postHistoryService.createRevisionHistory(question, question.contributor)

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
}
