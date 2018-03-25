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

  factory :homework, class: Task do
    associate :user
    name "complete homework"
    priority 1
    due_date {DateTime.now + 2.days}
  end
end
