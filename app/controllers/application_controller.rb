class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :load_schema, :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
  added_attrs = [:username, :email, :password, :password_confirmation,
                 :remember_me, :first_name,:last_name,:admin]
  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  devise_parameter_sanitizer.permit :account_update, keys: added_attrs
end

private
  def load_schema
    Apartment::Tenant.switch!('public')
    return unless request.subdomain.present?

    account = Account.find_by(subdomain: request.subdomain)
    if account
      Apartment::Tenant.switch!(account.subdomain)
    else
      redirect_to root_url(subdomain: false)
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
