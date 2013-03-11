package fr.isima

class AwardService {

  def awardHistoryService

  def save(Award award) {
    
    /* If the award can't be saved. */
    if (!award.validate()) {
      throw new Exception("Award can't be saved");
    }
    else {
      award.save();
    }
  }

  def checkAward (Contributor user) {
    
    def awardList = Award.findAll()
    awardList.each {
    
      Award a  = (Award) it
      
      switch(a.type) {
      
        case AwardType.REPUTATION:
        
          if (user.reputation >= a.bound)
            awardHistoryService.createAwardHistory(a, user)
          
          break;

        case AwardType.NB_QUESTIONS:
                
          def nbQuestions = 0					
          
          // If the award is determinate by a tag and a bound.
          if (a.tag != null) {
            
            def query = Question.where {
              tags { id == a.tag.id } && contributor == user
            }

            nbQuestions = query.count()
          }
          else 
            nbQuestions = Question.countByContributor(user)
          
          if (nbQuestions >= a.bound)
            awardHistoryService.createAwardHistory(a, user)
          
          break;


        case AwardType.NB_ANSWERS:
          
          def nbAnswers = 0
          
          if (a.tag != null) {
            
            Question.where { tags { id == a.tag.id } }.each { question ->
              question.answers.each {
                if (it.contributor == user)
                  nbAnswers++                
              }
            }
          } 
          else
            nbAnswers = Answer.countByContributor(user)

          if (nbAnswers >= a.bound)
            awardHistoryService.createAwardHistory(a, user)
            
          break;

        case AwardType.NB_COMMENTS:
        
          def nbComment = 0
          
          if (a.tag != null) {
         
           Question.where { tags { id == a.tag.id } }.each { question ->
              question.comments.each {
                if (it.contributor == user)
                  nbComment++                
              }
            }
          } 
          else
            nbComment = Comment.countByContributor(user)

          if (nbComment >= a.bound)
            awardHistoryService.createAwardHistory(a, user)

          break;
        }
    }
  }

  def newAward(String title, String description, int bound, Tag tag, AwardCategory category, AwardType type) {

    // Description computed for awardType different from Reputation
    if(tag != null) {
      title += " " + tag.name
    }

    new Award(title: title, bound: bound, tag: tag, category: category, type: type);
  }
}
