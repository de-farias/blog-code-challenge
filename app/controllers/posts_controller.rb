class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(author: current_user))

    if @post.save
      flash[:notice] = t('.post_created')
      redirect_to post_path(@post)
    else
      flash[:alert] = t('.failed_to_create_post')
      render :new
    end
  end

  def edit; end

  def update
    @post.assign_attributes(post_params)

    if @post.save
      flash[:notice] = t('.post_updated')
      redirect_to post_path(@post)
    else
      flash[:alert] = t('.failed_to_update_post')
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = t('.post_destroyed')
    else
      flash[:alert] = t('.failed_to_destroy_post')
    end

    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :raw_content)
  end
end
