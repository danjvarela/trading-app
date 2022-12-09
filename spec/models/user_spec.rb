require "rails_helper"

RSpec.describe User, type: :model do
  describe "user_type" do
    it "should have `trader` as a default value" do
      user = create :user
      expect(user.user_type).to eq("trader")
    end
  end
end
