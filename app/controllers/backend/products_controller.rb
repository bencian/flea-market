class Backend::ProductsController < BackendController
  def index
    @presenter = ProductsPresenter.new(params)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end
  
  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = 'Creado'
      redirect_to products_path
    else
      flash.now[:alert] = 'Error'
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :code,
      :price,
      :cost,
      :active,
      :category_id,
      tag_ids: [],
      product_images_attributes: [
        :id,
        :primary,
        :_destroy
      ]
    )
  end
end
