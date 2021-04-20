class Avatar < ApplicationRecord
  validates :name, presence: true
  before_save :set_image

  def to_s
    name
  end

  def set_image
    self.image_url = Faker::Avatar.image(size: "120x120")
  end
end