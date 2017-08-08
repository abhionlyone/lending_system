Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  post 'loans/collect_user_info'
  post 'loans/collect_company_info'
  post 'loans/complete_process'
  get 'loans' => 'loans#index'
  get 'loans/loan_request'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
