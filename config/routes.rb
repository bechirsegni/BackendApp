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
    authenticated :user do
      root 'home#project', as: :authenticated_root
    end
    root :to => redirect('/login')

    devise_for :users, path: '',
      path_names: { sign_up: '', sign_in: 'login', sign_out: 'logout' }
    namespace :manager do
      get  '/',          to: 'dashboard#index'
      get  'dashboard',  to: 'dashboard#index'
      get  'profile',    to: 'dashboard#profile'
      get  'employees',  to: 'users#index'
      get  'employees/new',  to: 'users#new'
      post 'employees/new',  to: 'users#add_user'

      resources :categories
      resources :products
    end
  end

  constraints(SubdomainBlank) do
    root 'home#index'
    get  'signup', to: 'accounts#new'
    post 'signup', to: 'accounts#create'
  end
end
