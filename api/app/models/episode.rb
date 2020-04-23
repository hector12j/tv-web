class Episode < ApplicationRecord
	belongs_to :video
	validates :title, presence: true
	validates :number, presence: true
	validates :video_id, presence: true
end
