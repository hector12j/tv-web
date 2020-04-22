class Video < ApplicationRecord
	validates :title, presence: true
	validates :type, presence: true, 
	validates :number
	has_many :episode
	has_many :user_video
end
