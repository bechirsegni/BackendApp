require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test 'account should have valid subdomain' do
    owner = User.new(email: "bechirsegni@gmail.com", password:"12345678",
                                        password_confirmation:"12345678")

    account = Account.new(subdomain: 'hello', owner: owner)
    assert account.valid?
  end

  test 'account should not use RESTRICTED_SUBDOMAINS' do
    owner = User.new(email: "bechirsegni@gmail.com", password:"12345678",
                                        password_confirmation:"12345678")

    account = Account.new(subdomain: 'www', owner: owner)
    assert_not account.valid?
  end

  test 'account subdomain should be downcased' do
    owner = User.new(email: "bechirsegni@gmail.com", password:"12345678",
                                        password_confirmation:"12345678")

    account = Account.new(subdomain: 'HELLO', owner: owner)
    account.save!
    assert_equal "hello",  account.subdomain
  end

  test 'account subdomain format should be valid' do
    owner = User.new(email: "bechirsegni@gmail.com", password:"12345678",
                                        password_confirmation:"12345678")

    account = Account.new(subdomain: 'HELLO', owner: owner)
    assert_match(/\A[\w\-]+\Z/i , account.subdomain.to_s)
    end

    test 'account subdomain format should not be valid' do
      owner = User.new(email: "bechirsegni@gmail.com", password:"12345678",
                                          password_confirmation:"12345678")

      account = Account.new(subdomain: '$$$$$', owner: owner)
      assert_no_match(/\A[\w\-]+\Z/i , account.subdomain.to_s)
      end
end
