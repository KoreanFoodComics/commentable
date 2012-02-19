Rails.application.routes.draw do
  mount Commentable::Engine => '/commentable', :as => :commentable_engine
  resources :news, :only => [:show]
end
