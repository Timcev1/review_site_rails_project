class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comments, :rating, :user, :job_id
  belongs_to :job
end
