import fr.isima.Tag
import grails.converters.JSON
import java.util.HashMap;

class BootStrap {

    def init = { servletContext ->
		
		new Tag(name: "C++").save()
		new Tag(name: "Java").save()
		new Tag(name: "C").save()
		new Tag(name: "Groovy").save()
		
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
