class UsersFilter
  include ActiveModel::Model

  attr_accessor :query

  def initialize(params)
    @query = params[:query]
  end

  def call
    users = Admin.all
    users = users.with_username(@query) unless @query.blank?
    users
  end

end
