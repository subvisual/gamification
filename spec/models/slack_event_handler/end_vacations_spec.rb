require "rails_helper"

RSpec.describe SlackEventHandler::EndVacations do
  it "changes the user not to be on vacations" do
    event = double(:event, user: create(:user), reply: true)
    event.user.start_vacations

    SlackEventHandler::EndVacations.new(event).run

    expect(event.user).not_to be_on_vacations
  end
end
