package fr.isima

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class IndexController {

  def index = { 

    def questions = Question.listOrderByCreationDate(max: 10, order: 'desc')
    def config = SpringSecurityUtils.securityConfig

    String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
    
    def awardsHistory = AwardHistory.findAll([sort: "date", order: 'desc', max: 5])

    [questions: questions, tags: Tag.findAll([sort: "name", max: 6]), questionNb : Question.count(), postUrl: postUrl, awardsHistory: awardsHistory]
  }
}
