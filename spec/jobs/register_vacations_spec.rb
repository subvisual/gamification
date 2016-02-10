require "rails_helper"

RSpec.describe RegisterVacations do
  let!(:vacations_action) { create(:action, slug: :day_on_vacations, points: 10) }

  it "gives points to users on vacations" do
    user = create(:user, points: 0)
    user_on_vacations = create(:user, points: 0, started_vacations_at: DateTime.now)

    RegisterVacations.new.call

    expect(user.reload.points).to eql 0
    expect(user_on_vacations.reload.points).to eql vacations_action.points
  end

  it "creates a vacation event" do
    user = create(:user, started_vacations_at: DateTime.now)

    RegisterVacations.new.call

    expect(user.reload.events.count).to eql 1
  end
end
