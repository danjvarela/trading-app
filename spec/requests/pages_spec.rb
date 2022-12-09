require "rails_helper"

RSpec.describe "Pages", type: :request do
  before :each do
    sign_in create(:user)
  end

  describe "GET /home" do
    it "should render home page" do
      get root_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:home)
    end
  end
end
