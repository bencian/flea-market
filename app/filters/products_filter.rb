class ProductsFilter
  include ActiveModel::Model

  attr_accessor :query

  def initialize(params)
    @query = params[:query]
    @category_id = params[:category_id]
  end

  def call
    products = Product.all
    products = products.with_name(@query) unless @query.blank?
    products = products.with_category(@category_id) unless @category_id.blank?
    products
  end
end