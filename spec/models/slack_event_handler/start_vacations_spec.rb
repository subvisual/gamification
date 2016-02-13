require "rails_helper"

RSpec.describe SlackEventHandler::StartVacations do
  it "changes the user to being on vacations" do
    event = double(:event, user: create(:user), reply: true)

    SlackEventHandler::StartVacations.new(event).run

    expect(event.user).to be_on_vacations
  end
end
