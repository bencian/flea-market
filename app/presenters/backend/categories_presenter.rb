class Backend::CategoriesPresenter
  def initialize(params)
    @params = params
  end

  def categories
    @categories ||= filter.call.paginate(page: @params[:page], per_page: 5).decorate
  end

  def filter
    @filter ||= Backend::CategoriesFilter.new(filter_params)
  end

  private

  def filter_params
    @params[:backend_categories_filter] ? @params.require(:backend_categories_filter).permit(:query) : {}
  end
end
