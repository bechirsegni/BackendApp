class Manager::BusinessesController < Manager::BaseManagerController
  before_action :set_business, only: [:show, :edit, :update]

  def show
  end


  def new
    if @business = Business.first.present?
      redirect_to edit_manager_business_path(Business.first.id)
    else
    @business = Business.new
    end
  end

  def create
    @business = Business.create(business_params)
    @business.save!
    redirect_to manager_path
  end

  def edit
  end

  def update
    @business.update_attributes(business_params)
    @business.save
    redirect_to manager_path
  end

  private

  def set_business
    @business = Business.first
  end

  def business_params
    params.require(:business).permit(:name,:description,:address,:city,:postal,
                                    :email,:phone,:twitter,:facebook,:website)
  end
end
