import fr.isima.connection.Role
import fr.isima.connection.UserRole
import fr.isima.Tag
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
    def user1 = null
    
    try {

      user1 = new Contributor(username: "Toto", password: "fffffff", email: "", location: "", birthDate: new Date(), isAdmin: true, enabled: true)
      user1.save(flush : true);
      UserRole.create(user1, adminRole, true)

      user1 = new Contributor(username: "Dudu", password: "fffffff", email: "", location: "", birthDate: new Date(), isAdmin: true, enabled: true)
      user1.save(flush : true);
      UserRole.create(user1, userRole, true)

    }
    catch (e) {
      user1.errors.allErrors.each {
        println it
      }
    }
  
  }
  def destroy = {
  }
}
