require "rails_helper"

RSpec.describe SlackEventHandler::SaveAction do
  let!(:blog_post_action) { create(:action, slug: :blog_post, points: 50) }

  it "increments a user's points when a blog post is submitted" do
    sender = create(:user, points: 0)
    event = double(:event, reply: true, user: sender, text: "blog post")

    SlackEventHandler::SaveAction.new(event).run

    expect(sender.points).to be blog_post_action.points
  end
end
