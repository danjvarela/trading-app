require "rails_helper"

RSpec.describe "Trader", type: :request do
  let(:user) { create :user }
  let(:user_attributes) { attributes_for :user }

  before :each do
    sign_in user
  end

  describe "GET /custom/users" do
    it "redirects to root path" do
      get users_path
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET /custom/users/new" do
    it "redirects to root path" do
      get new_user_path
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET /custom/users/:id/edit" do
    it "redirects to root path" do
      get user_path(user)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET /custom/users/:id" do
    it "redirects to root path" do
      get user_path(user)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "POST /custom/users" do
    it "redirects to root path" do
      post users_path, params: {user: user_attributes}
      expect(response).to redirect_to(root_path)
    end
  end

  describe "PUT /custom/users/:id" do
    it "redirects to root path" do
      put user_path(user), params: {user: user_attributes}
      expect(response).to redirect_to(root_path)
    end
  end

  describe "DELETE /custom/users/:id" do
    it "redirects to root path" do
      delete user_path(user)
      expect(response).to redirect_to(root_path)
    end
  end
end
