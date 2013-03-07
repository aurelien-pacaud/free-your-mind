package fr.isima

import grails.test.mixin.*
import org.junit.*
import fr.isima.exception.TagException

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(TagService)
@Mock([Tag, Question])
class TagServiceTests {

  void testSaveOk() {

    def tag = new Tag(name: "XML", description: "")

    service.save(tag)

    assertNotNull Tag.get(1)
  }

  void testSaveFail() {

    def tag = new Tag()

    shouldFail(TagException) {

      service.save(tag)
    }
  }

  void testUpdateOk() {

    def tag = new Tag(name: "XML", description: "")
    service.save(tag)

    tag.name = "xml"
    tag.description = "description"

    service.update(tag)

    assertNotNull Tag.get(1)
    assertEquals "xml", Tag.get(1).name
    assertEquals "description", Tag.get(1).description
  }

  void testUpdateFail() {

    def tag = new Tag()

    shouldFail(TagException) {

      service.save(tag)
    }
  }

  void testDeleteOk() {

    def tag = new Tag(name: "XML", description: "", questions: [])
    service.save(tag)

    service.delete(Tag.get(1))
    assertNotNull Tag.get(1)
  }

  void testDeleteFail() {

    shouldFail(TagException) {

      service.delete(Tag.get(1))
    }
  }
}
