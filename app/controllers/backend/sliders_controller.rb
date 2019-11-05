class Backend::SlidersController < BackendController

  def show
    @slider = Sliders.find(params[:id]).decorate
  end

  def new
    @slider = Slider.newx
  end

  def edit
    @slider = Slider.find(params[:id])
  end

  def create
    @slider = Slider.new(slider_params)

    if @slider.save
      flash[:notice] = 'Creado'
      redirect_to sliders_path
    else
      flash.now[:alert] = 'Error'
      render :new
    end
  end

  def update
    @slider = Slider.find(params[:id])
    if @slider.update(slider_params)
      flash[:notice] = 'Creado'
      redirect_to sliders_path
    else
      flash.now[:alert] = 'Error'
      render :edit
    end
  end

  def destroy
    @slider = Slider.find(params[:id])
    @slider.destroy
    flash[:notice] = 'Eliminado'
    redirect_to sliders_path
  end

  private

  def slider_params
    params.require(:slider).permit(:name, :image)
  end
end

