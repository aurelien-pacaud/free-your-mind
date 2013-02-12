package fr.isima

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class IndexController {

    def index = { 
		
		def questions = Question.getAll()
		def config = SpringSecurityUtils.securityConfig

		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		print "postUrl : " + postUrl
		[questions: questions, tags: Tag.findAll("from Tag as t order by char_length(t.name)"), questionNb : questions.size(), locality: "index", postUrl: postUrl]
	}
}
