Rails.application.routes.draw do
  scope "custom" do
    resources :users
  end
  devise_for :users
  root "pages#home"
end
