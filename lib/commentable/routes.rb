module Commentable::Routes
  def commentable_routes
    post 'comments' => 'comments#create'
  end
end
