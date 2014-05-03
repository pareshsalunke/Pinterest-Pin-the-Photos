class Board < ActiveRecord::Base
  attr_accessible :board_title, :category, :user, :id
  belongs_to :auser, :class_name => 'User', :foreign_key => 'user'
  has_one    :acategory, :class_name => 'Category', :foreign_key => 'category'

  has_many :follows
  has_many :users, through: :follows

end
