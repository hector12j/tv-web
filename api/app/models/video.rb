class Video < ApplicationRecord
	validates :title, presence: true
	validates :video_type, presence: true, inclusion: ['movie', 'season']
	validates :number, presence: true
	has_many :episodes, ->{ order(number: :asc) }
	has_many :store
end
