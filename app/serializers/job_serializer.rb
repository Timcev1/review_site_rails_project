class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category_id
  belongs_to :user
end
