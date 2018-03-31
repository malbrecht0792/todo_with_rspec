FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password 'Password1'
    encrypted_password 'Password1'
  end
end
