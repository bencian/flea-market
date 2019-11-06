class UsersPresenter
  def initialize(params)
    @params = params
  end

  def users
    @users ||= filter.call.paginate(page: @params[:page], per_page: 5)
  end

  def filter
    @filter ||= UsersFilter.new(filter_params)
  end

  private

  def filter_params
    @params[:users_filter] ? @params.require(:users_filter).permit(:query) : {}
  end
end
