class Manager::UsersController < Manager::BaseManagerController

  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def add_user
    @user = User.new(user_params)
    if @user.save!
      redirect_to manager_employees_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit( :first_name, :last_name, :password, :admin,
                                  :username, :email, :password_confirmation)
  end
end
