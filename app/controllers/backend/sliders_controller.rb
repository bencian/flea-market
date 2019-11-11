class Backend::SlidersController < BackendController

  def show
    @slider = Sliders.find(params[:id]).decorate
  end

  def new
    @slider = Slider.new
  end

  def edit
    @slider = Slider.find(params[:id])
  end

  def create
    @slider = Slider.new(slider_params)
    if @slider.save
      flash.now[:notice] = t('actions.new')
    else
      flash.now[:alert] = t('actions.error')
      render :save_error
    end
  end

  def update
    @slider = Slider.find(params[:id])
    if @slider.update(slider_params)
      flash[:notice] = t('actions.update')
    else
      flash.now[:alert] = t('actions.error')
      render :save_error
    end
  end

  def destroy
    @slider = Slider.find(params[:id])
    @slider.destroy
    flash[:notice] = t('actions.delete')
  end

  private

  def slider_params
    params.require(:slider).permit(:name, :image)
  end
end

