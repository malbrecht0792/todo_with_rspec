FactoryGirl.define do
  factory :task do
    name "buy beer"
    priority 2

    factory :vote do
      name 'vote'
      priority 1
    end

    factory :invalid_task do
      name nil
      priority nil
    end
  end

  factory :email, class: Task do
    association :user
    name "reply to Zack's email"
    priority 1
    due_date {DateTime.now}
  end

  factory :homework, class: Task do
    association :user
    name "complete homework"
    priority 1
    due_date {DateTime.now}
  end
end
