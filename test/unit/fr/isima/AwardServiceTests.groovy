package fr.isima

import grails.test.GrailsUnitTestCase

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
class AwardServiceTests extends GrailsUnitTestCase {

    void testInsertAward() {
		
		mockDomain(Award)
		//mockController(AwardController)
		def awardService = new AwardService()
		
		awardService.insert(new Award(title:"Test", description:"From scratch!", value:0, type:AwardType.CHOCOLATE))
		
		assertNotNull(Award.get(1))		
    }
}
