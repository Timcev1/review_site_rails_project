class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comments, :rating, :user, :job_id
end
