class Image < ActiveRecord::Base
  #require 'open-uri'

  attr_accessible :description, :tag_list, :uid, :web_url, :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :id, :content
  has_attached_file :photo, :styles => { :small => "150x150>", :medium => "300x300", :large => "600x600"}

  belongs_to :user
  has_many :pins
  has_many :likes
  has_many :users, through: :likes
  acts_as_taggable
  
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  def web_url=(url_value)
    self.photo = URI.parse(url_value) unless url_value.blank?
    super
  end
end
