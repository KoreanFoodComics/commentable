FactoryGirl.define do
  factory :user do
    name 'Test User'
  end

  factory :news do

  end

  factory :comment, :class => Comment do
    body 'Test Body'
  end
end
