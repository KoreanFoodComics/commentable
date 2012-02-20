FactoryGirl.define do
  factory :user do

  end

  factory :news do

  end

  factory :comment, :class => Commentable::Comment do
    body 'Test Body'
  end
end
