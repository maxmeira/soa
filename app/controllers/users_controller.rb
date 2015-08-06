class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @post = Post.new
    @posts = @user.posts.order('created_at DESC')
  end

  private

  def set_user
  	@user = User.find_by(email: params[:id])
  end
end
