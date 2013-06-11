class SessionsController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:user][:username])

    if @user.verify_password(params[:user][:password])
      @user.reset_session_token!
      session[:session_token] = @user.session_token

      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    @user = current_user

    unless @user.nil?
      session[:session_token] = nil
      @user.session_token = nil
      @user.save!
    end

    redirect_to new_session_url
  end
end
