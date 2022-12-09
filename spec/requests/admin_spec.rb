require "rails_helper"

RSpec.describe "Admin", type: :request do
  let(:user) { create :user }
  let(:user_attributes) { attributes_for :user }

  before :each do
    admin = create :user, user_type: "admin"
    sign_in admin
  end

  describe "GET /custom/users" do
    it "returns the users index page" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /custom/users/new" do
    it "returns the new user page" do
      get new_user_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /custom/users/:id/edit" do
    it "returns the edit user page" do
      get edit_user_path(user)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /custom/users/:id" do
    it "returns the user page" do
      get user_path(user)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /custom/users" do
    context "with correct parameters" do
      it "creates a new user and redirects to the root path" do
        before_count = User.count
        post users_path, params: {user: user_attributes}
        expect(response).to redirect_to(root_path)
        expect(User.count).to eq(before_count + 1)
      end
    end

    context "with incorrect parameters" do
      it "does not create a new user and renders new user page" do
        before_count = User.count
        post users_path, params: {user: user_attributes.merge({password: nil})}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(User.count).to eq(before_count)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT /custom/users/:id" do
    it "updates a user and redirects to the root_path" do
      put user_path(user), params: {user: user_attributes}
      expect(response).to redirect_to(root_path)
      expect(User.find(user.id).email).to eq(user_attributes[:email])
    end
  end

  describe "DELETE /custom/users/:id" do
    it "deletes a user and redirects to root_path" do
      created_user = user
      before_count = User.count
      delete user_path(created_user)
      expect(User.count).to eq(before_count - 1)
      expect(response).to redirect_to(root_path)
    end
  end
end
