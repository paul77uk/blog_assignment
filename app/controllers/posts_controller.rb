class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @post = Post.find(params[:id])
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to dashboards_path

    if @post.valid?
      @post.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by(id: session[:user_id])
    @post = Post.find(params[:id])
  end

  def update
    @user = User.find_by(id: session[:user_id])
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to user_post_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
