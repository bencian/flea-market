class Backend::UsersController < BackendController
  def index
    @presenter = UsersPresenter.new(params)
  end

  def new 
    @user = Admin.new
  end

  def create
    @user = Admin.new(user_params)
    @user.password=user_params[:username]
    @user.password_confirmation=user_params[:username] 
    if @user.save
      flash[:notice] = 'Creado'
      redirect_to users_path
    else
      flash.now[:alert] = @user.errors
      render :new
    end
    
  end


  private

  def user_params
    params.require(:admin).permit(:username, :email)
  end
end