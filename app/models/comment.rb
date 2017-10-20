class Comment < ApplicationRecord
  validates :rating, :inclusion => 1..10
   belongs_to :job
   belongs_to :user
end
