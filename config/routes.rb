Rails.application.routes.draw do
 resources :calendars,:scores
 
  resources :scores do
    collection { post :import }
  end

  get 'calendars/index'
  get 'calendars/show'
  devise_for :users

  root 'accesses#hello'
  
end
