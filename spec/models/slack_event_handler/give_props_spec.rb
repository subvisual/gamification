require "rails_helper"

RSpec.describe SlackEventHandler::GiveProps do
  let!(:props_action) { create(:action, slug: :props, points: 50) }

  it "increments a user's points" do
    sender = create(:user, props: 1)
    receiver = create(:user, points: 0)
    event = double(:event, reply: true, user: sender, mentioned_users: [receiver])

    SlackEventHandler::GiveProps.new(event).run

    expect(receiver.points).to be props_action.points
  end

  it "creates an event" do
    sender = create(:user, props: 1)
    receiver = create(:user, points: 0)
    event = double(:event, reply: true, user: sender, mentioned_users: [receiver])

    SlackEventHandler::GiveProps.new(event).run

    expect(receiver.events.count).to be 1
  end

  it "reduces the number of props a user can give" do
    sender = create(:user, props: 1)
    receiver = create(:user, points: 0)
    event = double(:event, reply: true, user: sender, mentioned_users: [receiver])

    SlackEventHandler::GiveProps.new(event).run

    expect(sender.props).to be 0
  end
end
