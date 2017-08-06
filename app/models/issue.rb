class Issue < ApplicationRecord
	validates :courseid, :useremail, :user_id, presence: true
	belongs_to :user
	has_many :comment
end
