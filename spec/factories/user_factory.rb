FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password "Yellow23746"
    password_confirmation { |u| u.password }
    first_name "Bella"
    last_name "Vida"
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email
    password "Blue46573"
    password_confirmation { |u| u.password }
    admin true
    first_name "Admin"
    last_name "User"
  end
end