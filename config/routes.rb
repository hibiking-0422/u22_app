Rails.application.routes.draw do
  get 'mypages/show'
 resources :calendars,:scores,:accounts,:timers,:accesses,:mypages
 
  resources :scores do
    collection { post :import }
  end

  resources :timers do
    collection { get :session }
  end

  get"scoress/set_content"
  get 'calendars/index'
  get 'calendars/show'
  devise_for :users

  root 'accesses#hello'
  
end
