import fr.isima.connection.Role
import fr.isima.connection.UserRole
import fr.isima.Tag
import fr.isima.Award
import fr.isima.AwardType
import fr.isima.AwardCategory
import fr.isima.Contributor
import grails.converters.JSON
import java.util.HashMap;

import org.springframework.security.core.userdetails.UsernameNotFoundException;

class BootStrap {

  def init = { servletContext ->

    new Tag(name: "C++", description: "C++ is a widely-used, statically-typed, free-form, compiled, multi-paradigm, multi-level, " + 
    "imperative, general-purpose, object-oriented programming language based on C.").save()
    new Tag(name: "Java", description: "Java is an object-oriented language and runtime environment (JRE). Java programs are platform " + 
    "independent because the program execution is handled by a Virtual Machine called the Java VM or JVM.").save()
    new Tag(name: "C", description: "C").save()
    new Tag(name: "Groovy", description: "Groovy").save()
    new Tag(name: "C#", description: "C++ is a widely-used, statically-typed, free-form, compiled, multi-paradigm, multi-level, " +
    "imperative, general-purpose, object-oriented programming language based on C.").save()
    new Tag(name: "Grails", description: "C++ is a widely-used, statically-typed, free-form, compiled, multi-paradigm, multi-level, " +
    "imperative, general-purpose, object-oriented programming language based on C.").save()


    Tag.metaClass.static.json = {

      HashMap jsonMap = new HashMap()
      def tagsList = Tag.getAll()

      jsonMap.tags = tagsList.collect{it.properties['id', 'name']}

      jsonMap as JSON
    }

    // Role creation
    def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
    def moderatorRole = new Role(authority: 'ROLE_MODERATOR').save(flush: true)
    def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
	
    // Users creation   
    def user = null
    
    try {

      user = new Contributor(username: "Toto", password: "fffffff", email: "", location: "", birthDate: new Date(), isAdmin: true, enabled: true)
      user.save(flush : true);
      UserRole.create(user, adminRole, true)
      
      user = new Contributor(username: "Jupal", password: "fffffff", email: "", location: "", birthDate: new Date(), isAdmin: true, enabled: true)
      user.save(flush : true);
      UserRole.create(user, adminRole, true)

      
      (1..10).each {

        user = new Contributor(username: "User" + it, password: "fffffff", email: "", location: "", birthDate: new Date(), enabled: true)
        user.save(flush : true);
        UserRole.create(user, userRole, true)
      }

    }
    catch (e) {
      user.errors.allErrors.each {
        println it
      }
    }

    // Add award
    def award = null

    try {

     award = new Award(title: "N00b", bound: 1, type: AwardType.REPUTATION, category: AwardCategory.BRONZE)
     award.save()
     
     award = new Award(title: "C++ Beginner", bound: 3, type: AwardType.NB_QUESTIONS, category: AwardCategory.SILVER, tag: Tag.get(1))
     award.save()
     
     award = new Award(title: "C++ Helper", bound: 5, type: AwardType.NB_ANSWERS, category: AwardCategory.SILVER, tag: Tag.get(1))
     award.save()
    }
    catch (e) {
      award.errors.allErrors.each {
        println it
      }
    }
  
  }
  def destroy = {
  }
}
