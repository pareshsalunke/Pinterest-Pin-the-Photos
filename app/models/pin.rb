class Pin < ActiveRecord::Base
  attr_accessible :board, :pic, :pin_time, :user, :apic, :board_title, :aboard, :content, :name
  belongs_to :auser, :class_name => 'User', :foreign_key => 'user' 
  belongs_to :apic,  :class_name => 'Image',:foreign_key => 'pic'
  belongs_to :aboard, :class_name => 'Board', :foreign_key => 'board'
  has_one :image

  has_many :comments, as: :commentable



end
