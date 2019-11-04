class TagsPresenter
  def initialize(params)
    @params = params
  end

  def tags
    @tags ||= filter.call.paginate(page: @params[:page], per_page: 5).decorate
  end

  def filter
    @filter ||= TagsFilter.new(filter_params)
  end

  private

  def filter_params
    @params[:tags_filter] ? @params.require(:tags_filter).permit(:query) : {}
  end
end
