Rails.application.routes.draw do
 resources :calendars,:scores
 
  get 'calendars/index'
  get 'calendars/show'
  devise_for :users

  root 'accesses#hello'
  
end
