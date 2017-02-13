class Manager::UsersController < Manager::BaseManagerController

  def new
    @user = User.new
  end

  def add_user
    @user = User.new(user_params)
     if @user.save!
       redirect_to root_path
     else
       render :new
     end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
                                 :username, :admin, :email, :password,
                                 :password_confirmation)
  end
end
