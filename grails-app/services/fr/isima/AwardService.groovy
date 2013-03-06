package fr.isima

class AwardService {
	
	def awardHistoryService
    
	def create(Award award) {
		/* If the award can't be saved. */
		if (!award.validate()) {
		  throw new Exception("Award can't be saved");
		}
		else {
		  award.save();
		}
    }
	
	def checkAward (Contributor user) {
		print "Check award"
		def awardList = Award.findAll()
		awardList.each {
			Award a  = (Award) it
			switch(a.type) {
				case AwardType.REPUTATION:
					print "REPUT"
					if (user.reputation >= a.bound) {
						awardHistoryService.createAwardHistory(a,user)
					}
					break;
					
				case AwardType.NB_QUESTIONS:
					print "QUESTION"
					def nbQuestions = 0					
					if (a.tag != null) {
						def questions = Question.findAllByContributor(user)
						
						questions.each {
							def q = (Question) it
							for(Tag t :q.tags) { 
								if( a.tag.id == t.id)
									nbQuestions++
							}
						}
					} else {
						nbQuestions = Question.findAllByContributor(user).size()
					}
					
					if (nbQuestions >= a.bound) {
						awardHistoryService.createAwardHistory(a,user)
					} 
					break;
					
				
				case AwardType.NB_ANSWERS:
					print "ANSWER"
					def nbAnswers = 0
					if (a.tag != null) {
						def answers = Answer.findAllByContributor(user)
						answers.each {
							def answ = (Answer) it
							for(Tag t : answ.question.tags) {
								if( a.tag.id == t.id)
									nbAnswers++
							}
						}
					} else {
						nbAnswers = Answer.findAllByContributor(user).size()
					}
					
					if (nbAnswers >= a.bound) {
						awardHistoryService.createAwardHistory(a,user)
					}
					break;
					
				case AwardType.NB_COMMENTS:
					print "COMMENT"
					def nbComment = 0
					if (a.tag != null) {
						def comments = Comment.findAllByContributor(user)
						comments.each {
							def comm = (Comment) it
							if (Answer.is(comm.post)) {
								for(Tag t : comm.post.question.tags) {
									if( a.tag.id == t.id)
										nbComment++
								}
							} else {
								for(Tag t : comm.post.tags) {
									if( a.tag.id == t.id)
										nbComment++
								}
							}
						}
					} else {
						nbComment = Comment.findAllByContributor(user).size()
					}
					
					if (nbComment >= a.bound) {
						awardHistoryService.createAwardHistory(a,user)
					}
					break;
			}
			user.save()
		}
	}
}
