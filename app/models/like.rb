class Like < ActiveRecord::Base
  attr_accessible :image_id, :user_id, :user, :image

   
  belongs_to :image, :class_name => 'Image', :foreign_key => 'image_id'
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'

  def already_likes?(image_id)
	  User.likes.find(:all, :conditions => ['image_id = ?', image_id]).size > 0
  end
end
