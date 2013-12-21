class GoalsController < ApplicationController
  def create
    params[:goal][:user_id] = current_user.id
    params[:goal][:completed] = false
    @goal = Goal.new(params[:goal])
    if @goal.save
      redirect_to user_url(@goal.user)
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to user_url(@goal.user)
    end
  end

  def edit
    @goal = Goal.find_by_id(params[:id])
    render :edit
  end

  def update
    @goal = Goal.find_by_id(params[:id])
    if @goal.update_attributes(params[:goal])
      redirect_to user_url(@goal.user)
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to user_url(@goal.user)
    end
  end

  def destroy
    goal = Goal.find_by_id(params[:id])
    user = goal.user
    goal.delete
    redirect_to user_url(user)
  end

  def show
    @goal = Goal.find_by_id(params[:id])
    render :show
  end
end
