class SlidersFilter
  include ActiveModel::Model

  attr_accessor :query

  def initialize(params)
    @query = params[:query]
  end

  def call
    sliders = Slider.all
    sliders = sliders.with_name(@query) unless @query.blank?
    sliders
  end

end
