class Video < ApplicationRecord
	validates :title, presence: true
	validates :video_type, presence: true
	validates :number, presence: true
	has_many :episodes 
	has_many :stores
end
