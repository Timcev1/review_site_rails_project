class JobSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category_id
end
