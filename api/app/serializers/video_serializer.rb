class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot,:quality, :price, :video_type, :number, :episodes
  has_many :episodes
end
