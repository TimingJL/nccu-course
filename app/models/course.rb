class Course < ApplicationRecord
	def self.search(search)

	  where("courseid = ? OR semester LIKE ? OR instructor LIKE ? OR point LIKE ? OR session LIKE ? OR place LIKE ? OR language LIKE ? OR asgeneral LIKE ? OR generalclass LIKE ? OR department LIKE ? OR length = ? OR choose LIKE ? OR coregeneral LIKE ? OR name LIKE ? OR change LIKE ? OR note LIKE ?", 
	  	"%#{search}%",
	  	"%#{search}%",
	  	"%#{search}%",
	  	"%#{search}%",
	  	"%#{search}%",
	  	"%#{search}%",
	  	"%#{search}%",
	  	"%#{search}%",
	  	"%#{search}%",
	  	"%#{search}%",
	  	"%#{search}%",
	  	"%#{search}%",
	  	"%#{search}%",
	  	"%#{search}%",
	  	"%#{search}%",
	  	"%#{search}%")

	end
end
