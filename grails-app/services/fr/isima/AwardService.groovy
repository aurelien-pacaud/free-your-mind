package fr.isima

class AwardService {

    def insert(Award award) {
		award.save()
    }
}
