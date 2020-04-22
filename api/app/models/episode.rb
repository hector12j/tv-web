class Episode < ApplicationRecord
	validates :title, presence: true
	validates :number, presence: true
	validates :videos_id, presence: true
	belongs_to :video
end
