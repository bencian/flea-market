class TagsFilter
  include ActiveModel::Model

  attr_accessor :query

  def initialize(params)
    @query = params[:query]
  end

  def call
    tags = Tag.all
    tags = tags.with_name(@query) unless @query.blank?
    tags
  end

end
