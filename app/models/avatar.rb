class Avatar < ApplicationRecord
  validates :name, presence: true
  before_create :set_image

  after_create_commit { broadcast_prepend_to "avatars", target: "avatars" }

  after_destroy_commit do
    broadcast_remove_to "avatars" 
    broadcast_replace_to "avatars",
      target: "welcome_#{self.id}",
      partial: "layouts/welcome",
      locals: {
        session: {
          avatar_id: self.id
        }
      }
  end
  
  after_update_commit { broadcast_replace_to "avatars" }
  
  after_commit do
    Turbo::StreamsChannel.broadcast_replace_to "avatars",
    target: "avatars_counter",
    partial: "avatars/count" 
  end 

  def to_s
    name
  end

  def set_image
    self.image_url = Faker::Avatar.image(size: "120x120")
  end
end