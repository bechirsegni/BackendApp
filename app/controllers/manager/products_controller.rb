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
      redirect_to manager_products_url
    else
      render :new
    end
  end

  def edit
  end


  def update
    @product.update_attributes(products_params)
    if @product.save!
      redirect_to manager_products_url
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
    prices_keys = params[:product].try(:fetch, :price, {}).keys
    params.require(:product).permit(:title,:duration, :description,:ingredients,
                                    :category_id,:image, price: prices_keys)
  end

end
