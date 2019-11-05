class SlidersPresenter
  def initialize(params)
    @params = params
  end

  def sliders
    @sliders ||= filter.call.paginate(page: @params[:page], per_page: 5).decorate
  end

  def filter
    @filter ||= SlidersFilter.new(filter_params)
  end

  private

  def filter_params
    @params[:sliders_filter] ? @params.require(:sliders_filter).permit(:query) : {}
  end
end
