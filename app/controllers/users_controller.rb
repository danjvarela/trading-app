class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, only: [:show, :edit, :update, :destroy]
  before_action :get_user_types, only: [:new, :edit, :create, :update]
  before_action :prevent_non_admin

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params_with_optional_password)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_type)
  end

  def get_user
    @user = User.find params[:id]
  end

  def get_user_types
    @user_types = User.user_types.keys.map { |type| [type.humanize, type] }
  end

  def user_params_with_optional_password
    if user_params[:password].blank? && user_params[:password_confirmation].blank?
      return user_params.except(:password, :password_confirmation)
    end
    user_params
  end

  def prevent_non_admin
    redirect_to root_path unless current_user.user_type == "admin"
  end
end
