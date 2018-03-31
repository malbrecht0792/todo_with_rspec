require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build_stubbed(:user) }
  let(:user_with_tasks) { build(:user_with_tasks) }
  
  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it 'is invalid without a first name' do
    user.firstname = nil
    expect(user).not_to be_valid
  end
  
  it 'is invalid without a last name' do
    user.lastname = nil
    expect(user).not_to be_valid
  end

  it 'is invalid without an email' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'is invalid without a unique email' do
    user = create(:user)
    other_user = build(:user, email: user.email)

    expect(other_user.save).to eq(false)
  end

  it 'has many tasks' do
    expect(user_with_tasks.tasks.length).to eq(2)
  end

  it 'returns tasks due today' do
    task = user_with_tasks.tasks.first

    allow(task).to receive(:due_date).and_return(DateTime.tomorrow)

    expect(user_with_tasks.due_today.length).to eq(1)
  end

end
