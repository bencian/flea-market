class Frontend::ProductsController < FrontendController
  def index
    @presenter = FrontendProductsPresenter.new(params)
  end

  def show
    @product = Product.find(params[:id]).decorate
  end
end
