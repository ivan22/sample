FactoryGirl.define do
  factory :product do
    title 'Ruby Programming Book'
    description 'This is a great book!'
    price 15.99
    category { create(:category) }
  end
end
