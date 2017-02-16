class Manager::CategoriesController < Manager::BaseManagerController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(categories_params)
    if @category.save!
      redirect_to manager_categories_path
    else
      render :new
    end
  end

  private

  def categories_params
    params.require(:category).permit(:name,:parent_id)
  end
end
