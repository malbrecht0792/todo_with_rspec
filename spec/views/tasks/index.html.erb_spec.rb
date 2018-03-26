require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      create(:task),
      create(:task)
    ])
  end

  it "renders a list of tasks" do
    render
  end
end
