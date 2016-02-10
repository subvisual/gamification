require "rails_helper"

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:points) }
  it { should validate_presence_of(:props) }
  it { should validate_numericality_of(:points) }
  it { should validate_numericality_of(:props) }

  describe "start_vacations" do
    it "sets the started_vacations_at property" do
      user = create(:user, started_vacations_at: nil)

      user.start_vacations

      expect(user.started_vacations_at).not_to be nil
    end
  end

  describe "end_vacations" do
    it "deletes the started_vacations_at property" do
      user = create(:user, started_vacations_at: DateTime.now)

      user.end_vacations

      expect(user.started_vacations_at).to be nil
    end
  end

  describe "on_vacations?" do
    it "is true if the user started vacations" do
      user = create(:user)

      user.start_vacations

      expect(user).to be_on_vacations
    end
  end
end
