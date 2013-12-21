module ApplicationHelper
  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    redirect_to new_session_url unless logged_in?
  end

  def already_gave_cheer?
    u = current_user
    g = Goal.find(params[:id])
    Cheer.find_by_user_id_and_goal_id(u.id, g.id)
  end
end
