class FrontendProductsPresenter
  def initialize(params)
    @params = params
  end

  def products
    @products ||= filter.call
                        .paginate(page: @params[:page], per_page: 8)
                        .decorate
  end

  def filter
    @filter ||= ProductsFilter.new(filter_params)
  end

  private

  def filter_params
    @params.fetch(:products_filter, {}).permit(
      :query,
      :category_id,
      :order_by
    ).merge(only_active: true)
  end
end
