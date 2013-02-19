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

    new Contributor(firstName: "AAAA", lastName: "BBBB", username:"Toto", password: "fffffff").save(flush: true)

    // Role creation
    def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
    def moderatorRole = new Role(authority: 'ROLE_MODERATOR').save(flush: true)
    def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
	
	// Users creation
	/*
	def user1 = new Contributor(username:"Toto",password:"ffffff", email: "", location: "", birthDate: "", isAdmin: true,
								nbProfileViews: 0, registrationDate: new Date());
	user1.enabled = true
	user1.save(flush : true);
	print "User " + user1
	UserRole.create(user1, adminRole, true)
	
	def user2 = new Contributor(username:"Jupal",password:"ffffff", email: "", location: "", birthDate: "", isAdmin: true,
								nbProfileViews: 0, registrationDate: new Date());
	user2.enabled = true
	user2.save(flush : true);
	UserRole.create(user2, adminRole, true)
	
	def user3 = new Contributor(username:"Moderator",password:"ffffff", email: "", location: "", birthDate: "", isAdmin: true,
								nbProfileViews: 0, registrationDate: new Date());
	user3.enabled = true
	user3.save(flush : true);
	UserRole.create(user3, moderatorRole, true)
	
	def user4 = new Contributor(username:"User",password:"ffffff", email: "", location: "", birthDate: "", isAdmin: true,
								nbProfileViews: 0, registrationDate: new Date());
	user4.enabled = true
	user4.save(flush : true);
	UserRole.create(user4, userRole, true)
	*/
	
  }
  def destroy = {
  }
}
