class Profile < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, 
                    :default_url =>ActionController::Base.helpers.image_path("images/missing_thumb.png")
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  
 #ActionController::Base.helpers.image_path("/missing.png")
 
end
