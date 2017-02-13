class Manager::ProductsController < Manager::BaseManagerController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
  end

  def create
    @product = Product.create(products_params)
    if @product.save!
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end


  def update
    @product.update_attributes(products_params)
    if @product.save!
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy!
      redirect_to products_path
    else
      render @product
    end
  end

private

  def set_product
    @product = Product.find(params[:id])
  end

  def products_params
    params.require(:product).permit(:title,:description, :category_id)
  end

end
