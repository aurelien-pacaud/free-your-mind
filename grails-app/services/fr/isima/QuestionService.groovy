package fr.isima

import com.naleid.grails.MarkdownService;

import fr.isima.exception.PostException


class QuestionService {

  def postHistoryService

  def create(Question question) {

    /* If the question can't be saved. */
    if (!question.validate()) {

      throw new PostException("Post can't be saved");
    }
    else {

      question.save();
      postHistoryService.createAskedHistory(question, question.contributor)
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

  def update(Question question) {

    question.lastEditionDate = new Date()

    /* If the question can't be saved. */
    if (!question.validate()) {

      throw new PostException("Post can't be saved");
    }
    else {

      question.save();
      //postHistoryService.createRevisionHistory(question, question.contributor)
    }
  }

}
