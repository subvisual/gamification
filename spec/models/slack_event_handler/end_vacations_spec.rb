require "rails_helper"

RSpec.describe SlackEventHandler::EndVacations do
  it "changes the user not to be on vacations" do
    user = create(:user)
    user.start_vacations

    SlackEventHandler::EndVacations.new(user: user).call

    expect(user).not_to be_on_vacations
  end
end
