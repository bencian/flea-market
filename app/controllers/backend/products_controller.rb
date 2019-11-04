class Backend::ProductsController < BackendController
  def index
    @products = ProductsPresenter.new(params)
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def create
  end

  def update
  end

  def destroy
  end
end
