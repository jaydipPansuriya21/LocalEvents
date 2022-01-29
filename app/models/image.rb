class Image < ApplicationRecord
  belongs_to :picture, polymorphic: true

  def save_image_information(info_hash = {})
    object = get_object(info_hash[:id], info_hash[:type])
    self.picture = object
    self.save 
  end

  
  private

  def get_object(id, type)
    if type == "event"
      return Event.find(id)
    elsif type == 'user'
      return User.find(id)
    end
  end
end
