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
    resources :categories
    resources :products

    authenticated :user do
      root 'home#project', :as => :authenticated_root
    end
    root :to => redirect('/login')

    devise_for :users, path: '',
     path_names: {sign_up: '', sign_in: 'login', sign_out: 'logout'}

    get  'employees',  to: 'users#new'
    post 'employees',  to: 'users#add_user'
    get  'dashboard',  to: 'dashboard#index'
  end

  constraints(SubdomainBlank) do
    root 'home#index'
    get  'signup', to: 'accounts#new'
    post 'signup', to: 'accounts#create'
  end
end
