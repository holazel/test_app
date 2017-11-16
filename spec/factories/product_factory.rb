FactoryGirl.define do

  sequence(:id) { |n| "#{n}" }

  factory :product do
    name "Generated bike"
    image_url "C16.jpg"
    price "100.99"
    colour "blue"
    description "Nice bike"
    id 
  end
end