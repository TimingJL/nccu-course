class Issue < ApplicationRecord
	acts_as_votable
	validates :courseid, :useremail, :user_id, presence: true
	belongs_to :user
	has_many :comment
end
