require "rails_helper"

RSpec.describe SlackEventHandler::StartVacations do
  it "changes the user to being on vacations" do
    user = create(:user)

    SlackEventHandler::StartVacations.new(user: user).call

    expect(user).to be_on_vacations
  end
end
