class ProductsFilter
  include ActiveModel::Model

  attr_accessor :query

  def initialize(params)
    @query = params[:query]
  end

  def call
    products = Product.all
    products = products.with_title(@query) unless @query.blank?
    products
  end
end