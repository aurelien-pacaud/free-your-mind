import fr.isima.Tag
import grails.converters.JSON
import java.util.HashMap;

class BootStrap {

    def init = { servletContext ->
		
		new Tag(name: "C++", description: "C++ is a widely-used, statically-typed, free-form, compiled, multi-paradigm, multi-level, " + 
									      "imperative, general-purpose, object-oriented programming language based on C.").save()
		new Tag(name: "Java", description: "Java").save()
		new Tag(name: "C", description: "V").save()
		new Tag(name: "Groovy", description: "Groovy").save()
		
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
