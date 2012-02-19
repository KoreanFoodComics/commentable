Rails.application.routes.draw do

  mount Commentable::Engine => "/commentable"
end
