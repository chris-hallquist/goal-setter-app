class UsersController < ApplicationController

  before_filter :authenticate, :only => :show

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:session_token] = @user.reset_session_token!
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

end
