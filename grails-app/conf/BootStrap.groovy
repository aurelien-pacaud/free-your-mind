import fr.isima.Tag
import grails.converters.JSON
import java.util.HashMap;

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
    }
    def destroy = {
    }
}
