package fr.isima

class ContributorService {

	
	/**
	 * Try to create a new user in the DB
	 * @param c COntributor to create
	 * @return True if the contributor is inserted
	 * 		   False otherwise
	 */
    def create(Contributor c) {
		
		if (!c.validate()) {
			return true
		} else {
			c.save();
			return false;
		}
    }
}
