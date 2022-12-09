require "rails_helper"

RSpec.describe User, type: :model do
  describe "user_type" do
    it "should trader by default" do
      user = create :user
      expect(user.trader?).to be(true)
    end
  end
end
