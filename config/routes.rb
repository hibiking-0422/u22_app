Rails.application.routes.draw do
  get 'calendars/index'
  get 'calendars/show'
  devise_for :users
  get 'accesses/hello'
  get 'accesses/goodbye'
  root 'accesses#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
