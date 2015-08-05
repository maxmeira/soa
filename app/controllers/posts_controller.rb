class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      respond_to do |format|
        format.html { redirect_to user_path(@post.user.email), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      end
    else
      redirect_to user_path(@post.user.email), notice: "Something went wrong"
    end
  end

  def update
    if @post.update(post_params)
      respond_to do |format|
        format.html {redirect_to user_path(@post.user.email), notice: "Post Updated"}
      end
    else
      redirect_to post_path(@post), notice: "Something went wrong"
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html {redirect_to user_path(@post.user.email), notice: "Post Destroyed"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :content_html, :user_id)
    end
end
