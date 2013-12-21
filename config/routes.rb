GoalSetterApp::Application.routes.draw do

  resources :users
  resource :session
  resources :goals do
    resources :cheers
  end
end
