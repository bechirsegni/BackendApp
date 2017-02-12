class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do
  constraints(SubdomainPresent) do
    root 'home#project', as: :subdomain_root
    devise_for :users
    get  'employees',  to: 'users#new'
    post 'employees',  to: 'users#add_user'
    resources :categories
  end

  constraints(SubdomainBlank) do
    root 'home#index'
    resources :accounts, only: [:new, :create]
  end
end
