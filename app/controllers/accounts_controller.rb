class AccountsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @account = Account.new
    @account.build_owner
  end

  def create
    @account = Account.new(account_params)
    if @account.valid?
      Apartment::Tenant.create(@account.subdomain)
      Apartment::Tenant.switch!(@account.subdomain) rescue Apartment::Tenant.reset
      @account.owner.admin = true
      @account.save
      redirect_to new_user_session_url(subdomain: @account.subdomain)
    else
      render :new
    end
  end

private
  def account_params
    params.require(:account).permit(:subdomain,
                owner_attributes: [ :first_name, :last_name, :username,
                                    :admin, :email, :password,
                                    :password_confirmation])
  end
end
