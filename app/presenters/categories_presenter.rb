class CategoriesPresenter
  def initialize(params)
    @params = params
  end

  def categories
    @categories ||= filter.call.paginate(page: @params[:page], per_page: 5).decorate
  end

  def filter
    @filter ||= CategoriesFilter.new(filter_params)
  end

  private

  def filter_params
    @params[:categories_filter] ? @params.require(:categories_filter).permit(:query) : {}
  end
end
