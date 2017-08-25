class Course < ApplicationRecord
	def self.search(search)
	  where("courseid LIKE ? OR semester LIKE ? OR instructor LIKE ? OR point LIKE ? OR session LIKE ? OR place LIKE ? OR language LIKE ? OR asgeneral LIKE ? OR generalclass LIKE ? OR department LIKE ? OR length LIKE ? OR choose LIKE ? OR coregeneral LIKE ? OR name LIKE ? OR change LIKE ? OR note LIKE ?", 
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

	def self.search_name(name)
		where("name LIKE ?","%#{name}%")
	end

	def self.search_department(department)
		where("department LIKE ?","%#{department}%")
	end

	def self.search_instructor(instructor)
		where("instructor LIKE ?","%#{instructor}%")
	end

end
