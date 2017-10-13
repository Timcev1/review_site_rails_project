class Job < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :service_areas
  def service_area_attributes=(service_area_attributes)
    binding.pry
    service_area_attributes.each do |attribute|
      self.service_areas.build(attribute)
    end
  end

  def category_attributes=(category_attributes)
    self.category = Category.find_or_create_by(name: category_attributes[:name])
  end
end
