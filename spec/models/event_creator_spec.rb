require "rails_helper"

RSpec.describe EventCreator do
  it "increments the user's points" do
    action = create(:action, points: 2)
    user = create(:user, points: 0)

    EventCreator.new(action_slug: action.slug, user: user).call

    expect(user.points).to be 2
  end

  it "creates an event" do
    action = create(:action, points: 2)
    user = create(:user, points: 0)

    EventCreator.new(action_slug: action.slug, user: user).call

    expect(user.events.count).to be 1
  end
end
