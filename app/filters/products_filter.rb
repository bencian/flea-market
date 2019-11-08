class ProductsFilter
  include ActiveModel::Model

  attr_accessor :query, :category_id

  def initialize(params)
    @query = params[:query]
    @category_id = params[:category_id]
    @only_active = params[:only_active]
  end

  def call
    products = Product.all
    products = products.with_name(@query) unless @query.blank?
    products = products.with_category(@category_id) unless @category_id.blank?
    products = products.where(active: true) if @only_active
    products
  end
end