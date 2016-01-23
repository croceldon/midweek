FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'something'
    password_confirmation 'something'
  end

end
