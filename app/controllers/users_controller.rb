class UsersController < ApplicationController

  def show
    render :show
  end

  def new
    render :new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

end
