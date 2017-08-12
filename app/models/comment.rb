class Comment < ApplicationRecord
	acts_as_votable
	validates :content, presence: true
	belongs_to :user
	belongs_to :issue
end
