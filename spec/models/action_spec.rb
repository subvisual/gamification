require "rails_helper"

RSpec.describe Action, type: :model do
  it { should validate_presence_of(:slug) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:points) }
end
