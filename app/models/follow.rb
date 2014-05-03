class Follow < ActiveRecord::Base
  attr_accessible :board_id, :followed_id, :user_id, :user, :board, :user_follow

  belongs_to :board, :class_name => 'Board', :foreign_key => 'board_id'
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :user_follow, :class_name => 'User', :foreign_key => 'followed_id'

  def already_follows_user?(user_id)
    User.follows.find(:all, :conditions => ['followed_id = ?', user_id]).size > 0
  end
end
