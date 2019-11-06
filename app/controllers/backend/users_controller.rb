class Backend::UsersController < BackendController
  
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @presenter = UsersPresenter.new(params)
  end

  def new
    @user = Admin.new
  end

  def edit; end

  def create
    @user = Admin.new(user_params)
    @user.password = user_params[:username]
    @user.password_confirmation = user_params[:username]
    if @user.save
      flash[:notice] = 'Creado'
      redirect_to users_path
    else
      flash.now[:alert] = @user.errors
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Editado'
      redirect_to users_path
    else
      flash.now[:alert] = 'Error'
      render :edit
    end
  end

  def destroy
    if current_admin != @user
      @user.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'No te puedes borrar a ti mismo'
    end
    redirect_to users_path
  end


  private
  
  def set_user
    @user = Admin.find(params[:id])
  end

  def user_params
    params.require(:admin).permit(:username, :email)
  end
end
