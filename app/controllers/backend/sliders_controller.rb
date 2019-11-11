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
      flash.now[:notice] = 'Created'
    else
      flash.now[:alert] = 'Error'
      render :save_error
    end
  end

  def update
    @slider = Slider.find(params[:id])
    if @slider.update(slider_params)
      flash[:notice] = 'Updated'
    else
      flash.now[:alert] = 'Error'
      render :save_error
    end
  end

  def destroy
    @slider = Slider.find(params[:id])
    @slider.destroy
    flash[:notice] = 'Deleted'
  end

  private

  def slider_params
    params.require(:slider).permit(:name, :image)
  end
end

