class ProfilesController < ApplicationController
  def show
    @user = User.find_by_profile_name(params[:id])
    if @user
      @statuses = @user.statuses.all
      render action: :show
    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end

  def following
    @title = "Following"
    @user = User.find_by_profile_name(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find_by_profile_name(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
