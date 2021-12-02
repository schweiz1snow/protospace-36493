Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :users, only: :show
  # HTTPメソッド 'URIパターン', to: 'コントローラー名#アクション名'
  delete '/users/password/new(.:format)', to: 'devise/sessions#destroy'
  resources :prototypes do
    resources :comments, only: :create
  end
end
