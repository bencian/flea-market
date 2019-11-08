class ProductsFilter
  include ActiveModel::Model

  attr_accessor :query, :category_id, :order_by, :only_active

  def call
    products = Product.all
    products = products.with_name(query)           unless query.blank?
    products = products.with_category(category_id) unless category_id.blank?
    products = products.where(active: true)        if only_active
    products = products.order(order_field)

    products
  end

  private

  def order_field
    case order_by
    when 'asc'
      'name ASC'
    when 'desc'
      'name DESC'
    else
      'name ASC'
    end
  end
end
