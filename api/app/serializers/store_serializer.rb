class StoreSerializer < ActiveModel::Serializer
  attributes :video, :user, :created_at
end
