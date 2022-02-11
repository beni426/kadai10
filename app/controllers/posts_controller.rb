class PostsController < ApplicationController
  before_action :check_user, only: %i[edit update destroy]
  before_action :set_post, only: %i[show edit update destroy]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        ContactMailer.anounce(@post.user).deliver
        redirect_to posts_path, notice: "写真を投稿しました!"
      else
        render :new
      end
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end
  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end
  def edit
  end
  def update
    if @post.update(post_params)
     redirect_to posts_path, notice: "ブログを編集しました！"
     else
    render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path, notice:"ブログを削除しました！"
  end



  private
  def post_params
    params.require(:post).permit(:content,:image,:image_cache)
  end
  def set_post
    @post = Post.find(params[:id])
  end
  def check_user
    if @current_user.nil?
     redirect_to new_session_path unless logged_in?
    end
  end
end
