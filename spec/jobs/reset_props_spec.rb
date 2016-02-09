require "rails_helper"

RSpec.describe ResetProps do
  it "resets everyone's props to 10" do
    create_list(:user, 4, props: 2)

    ResetProps.new.call

    User.all.map do |user|
      expect(user.props).to be 10
    end
  end
end
