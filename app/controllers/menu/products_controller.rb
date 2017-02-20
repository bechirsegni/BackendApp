class Menu::ProductsController < Menu::BaseMenuController

  def index
    @products = Product.all
  end
end
