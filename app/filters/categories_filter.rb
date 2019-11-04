class CategoriesFilter
  include ActiveModel::Model

  attr_accessor :query

  def initialize(params)
    @query = params[:query]
  end

  def call
    categories = Category.all
    categories = categories.with_name(@query) unless @query.blank?
    categories
  end
end