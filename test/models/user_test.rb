require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def user
    @user = User.new(email: "bechirsegni@gmail.com", password:"12345678",
                                        password_confirmation:"12345678")
  end

  test 'user should have valid email' do
     assert user.valid?
  end

  test 'user should have password more than 8 chars' do
    new_user = User.new(email: "bechirsegni@gmail.com", password:"123456",
                                        password_confirmation:"123456")
    assert_not new_user.valid?
  end

  invalid_email_addresses = ['invalid email@example.com', 'invalid@ example.com',
                            'invalid@@example.com', 'invalid', 'invalid@example']

  def obj; @obj ||= User.new; end

    test 'should invalidate email address' do
        invalid_email_addresses.each do |email|
            obj.email = email
            assert_not obj.valid?
        end
    end

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    test 'user email format should be valid' do
      user = User.new(email: "bechirsegni@gmail.com", password:"12345678",
                                          password_confirmation:"12345678")
      assert_match(VALID_EMAIL_REGEX , user.email.to_s)
      end

      test 'user email format should not be valid' do
        user = User.new(email: "bechirsegni@gmail", password:"12345678",
                                            password_confirmation:"12345678")
        assert_no_match(VALID_EMAIL_REGEX , user.email.to_s)
        end

end
