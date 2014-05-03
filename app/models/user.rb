class User < ActiveRecord::Base
  rolify
  #include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :profile_name, :id, :full_name
  
  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                             with: /^[a-zA-Z0-9_-]+$/,
                             message: 'Must be formatted correctly.'
                           }

  has_many :statuses
  has_many :pins
  has_many :boards
  has_many :images, dependent: :destroy
  has_many :likes
  has_many :images, through: :likes
  has_many :user_friendships

  has_many :follows
  has_many :users, through: :follows
  has_many :boards, through: :follows

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_many :friends, through: :user_friendships,
                     conditions: { user_friendships: { state: 'accepted' } }

  has_many :pending_user_friendships, class_name: 'UserFriendship',
                                      foreign_key: :user_id,
                                      conditions: { state: 'pending' }
  has_many :pending_friends, through: :pending_user_friendships, source: :friend
  
  has_many :requested_user_friendships, class_name: 'UserFriendship',
                                      foreign_key: :user_id,
                                      conditions: { state: 'requested' }
  has_many :requested_friends, through: :requested_user_friendships, source: :friend
  
  has_many :blocked_user_friendships, class_name: 'UserFriendship',
                                      foreign_key: :user_id,
                                      conditions: { state: 'blocked' }
  has_many :blocked_friends, through: :blocked_user_friendships, source: :friend
  
  has_many :accepted_user_friendships, class_name: 'UserFriendship',
                                      foreign_key: :user_id,
                                      conditions: { state: 'accepted' }
  has_many :accepted_friends, through: :accepted_user_friendships, source: :friend


  def full_name
  	first_name + " " + last_name
  end

  def to_param
    profile_name
  end

  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)

    "http://gravatar.com/avatar/#{hash}"
  end

  def has_blocked?(other_user)
    blocked_friends.include?(other_user)
  end

  def already_likes?(image_id)
      self.likes.find(:all, :conditions => ['image_id = ?', image_id]).size > 0
  end

  # def already_follows_board?(board_id)
  #   self.follows.find(:all, :conditions => ['board_id = ?', board_id]).size > 0
  # end

  def already_follows_user?(user_id)
    self.follows.find(:all, :conditions => ['followed_id = ?', user_id]).size > 0
  end

  # def following?(other_user)
  #   relationships.where(followed_id: other_user.id)
  # end

  # def following
  #   @title = "Following"
  #   @user = User.find_by_profile_name(params[:id])
  #   @users = @user.followed_users.paginate(page: params[:page])
  #   render 'show_follow'
  # end

  # def follow!(other_user)
  #   relationships.create!(followed_id: other_user.id)
  # end

  # def unfollow!(other_user)
  #   relationships.where(followed_id: other_user.id).destroy!
  # end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find_by_profile_name(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    
end