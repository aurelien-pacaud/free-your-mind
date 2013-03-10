package fr.isima

import fr.isima.connection.Role
import fr.isima.connection.UserRole

class ContributorService {

	
	/**
	 * Try to create a new user in the DB
	 * @param c COntributor to create
	 * @return True if the contributor is inserted
	 * 		   False otherwise
	 */
    def create(Contributor c, String confirmPassword) {
		
		if (!c.validate()) {
			if (!confirmPassword.equals(c.password)) {
				c.errors.rejectValue('password','user.password.doesnotmatch')
				c.errors.reject('user.password.doesnotmatch',  ['password', 'class User'] as Object[],'[Property [{0}] of class [{1}] does not match confirmation]')
			}
			return false
		} else {
			if (!confirmPassword.equals(c.password)) {
				c.errors.rejectValue('password','user.password.doesnotmatch')
				c.errors.reject('user.password.doesnotmatch',  ['password', 'class User'] as Object[],'[Property [{0}] of class [{1}] does not match confirmation]')
				return false
			} else {
				c.enabled = true;
				c.save()
				// Add the user Role to the Contributor
				def role = Role.findByAuthority("ROLE_USER")
				UserRole.create(c, role, true)
				return true
			}
		}
    }
	
	/**
	 * Try to update a user in the DB
	 */
	def update(Contributor c) {
		if (!c.validate()) {
			return false
		} else {
			c.save()
			return true
		}
	}
	
	/** 
	 * Increment the profil view counter
	 * @param c Contributor to which we increment the counter
	 */
	def incrViewCounter(Contributor c) {
		c.nbProfileViews++
	}
}
