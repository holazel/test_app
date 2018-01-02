FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  sequence(:email2) { |n| "admin#{n}@example.com" }

  factory :user do 
    email { generate(:email) }
    password "Yellow23746"
    password_confirmation { |u| u.password }
    first_name "Bella"
    last_name "Vida"
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email { generate(:email2) }
    password "Blue46573"
    password_confirmation { |u| u.password }
    admin true
    first_name "Admin"
    last_name "User"
  end
  factory :admin2, class: User do
    email "admin2@gmail.com"
    password "Blue46573"
    password_confirmation { |u| u.password }
    admin true
    first_name "Admin"
    last_name "User"
  end
  factory :user2, class: User do
    email "user@gmail.com"
    password "Blue46573"
    password_confirmation { |u| u.password }
    admin true
    first_name "Admin"
    last_name "User"
  end
end