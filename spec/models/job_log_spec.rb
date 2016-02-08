require "rails_helper"

RSpec.describe JobLog, type: :model do
  it { should validate_presence_of(:name) }
end
