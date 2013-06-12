class PostsController < ApplicationController
  include SessionsHelper

  def index
    @circles = current_user.friend_circles(:include => :posts)
  end

  def new
    @post = Post.new
    @circles = current_user.friend_circles
  end

  def create
    @post = Post.new(params[:post])
    @post.author_id = current_user.id
    @circles = current_user.friend_circles
    if @post.save
      redirect_to feed_url
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    if @post.save
      redirect_to feed_url
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end




end
