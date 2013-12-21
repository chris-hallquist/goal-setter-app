class CheersController < ApplicationController
  def create
    goal = Goal.find_by_id(params[:goal_id])

    @cheer = Cheer.new(:user_id => current_user.id, :goal_id => goal.id)

    if current_user.cheers.count > 0
      flash[:errors] = "Cannot give more than 1 cheer"
      redirect_to goal_url(goal)
    else
      if @cheer.save
        redirect_to goal_url(goal)
      else
        flash[:errors] = @cheer.errors.full_messages
        redirect_to goal_url(goal)
      end
    end
  end
end
