class FriendCirclesController < ApplicationController
  include SessionsHelper

  def index
  end

  def new
    @friend_circle = FriendCircle.new
  end

  def create
    @friend_circle = FriendCircle.new(params[:friend_circle])
    @friend_circle.owner_id = current_user.id #remember this.
    @friend_circle.member_ids += [current_user.id]
    if @friend_circle.save
      redirect_to @friend_circle
    else
      #lash.now[:] fill in later
      render :new
    end
  end

  def show
    @friend_circle = FriendCircle.find(params[:id],
                                  :include => [:posts, :members, :owner])

    @posts = @friend_circle.posts
    # add posts
  end

  def update
    @friend_circle = FriendCircle.find(params[:id])
    @friend_circle.update_attributes(params[:friend_circle])
    if @friend_circle.save
      redirect_to @friend_circle
    else
      render :edit
    end
  end

  def edit
    @friend_circle = FriendCircle.find(params[:id])
  end
end
