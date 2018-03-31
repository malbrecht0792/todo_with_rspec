FactoryGirl.define do
  factory :user do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password 'Password1'
    encrypted_password 'Password1'
  
    factory :user_with_tasks do
      after(:build) do |user|
        [:email, :homework].each do |task|
          user.tasks << FactoryGirl.build(task, user: user)
        end
      end
    end
  end
end
