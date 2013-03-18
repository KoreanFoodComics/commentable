Rails.application.routes.draw do
  commentable_routes
  resources :news, :only => [:show]
end
