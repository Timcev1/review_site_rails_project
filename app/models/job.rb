class Job < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :service_areas
  validates :title, :description, :category_id, presence: true

    def service_areas_attributes=(service_areas_attributes)
      service_areas_attributes.each do |key, value|
        self.service_areas << ServiceArea.create(name: value)
        self.save
      end
    end

  def category_attributes=(category_attributes)
    self.category = Category.find_or_create_by(name: category_attributes[:name])
  end
end
