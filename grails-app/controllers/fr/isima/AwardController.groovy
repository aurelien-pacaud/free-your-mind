package fr.isima

import org.springframework.dao.DataIntegrityViolationException

import fr.isima.AwardType;

class AwardController {

	static scaffold = true
	def awardService
	
	def display = {
		
		[awards: Award.getAll()]
	}
	
	def createNewAward = {
						  
	    render "New award add"
	}
}