Commentable::Engine.routes.draw do
  post '/comments' => 'comments#create', :as => :comments
end
