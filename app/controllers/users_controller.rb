class UsersController < ApplicationController

<<<<<<< HEAD
  def index
    @users = User.where.not(id: current_user.id)
  end

=======
>>>>>>> users-devise
  def show
    @post = Post.new
    @posts = @user.posts.order('created_at DESC')
  end

  private

  def set_user
  	@user = User.find_by(email: params[:id])
  end
end
