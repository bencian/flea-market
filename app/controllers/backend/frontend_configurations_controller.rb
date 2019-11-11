class Backend::FrontendConfigurationsController < BackendController
  def index
    @presenter = SlidersPresenter.new(params)
    @configuration = FrontendConfiguration.first
  end

  def edit
    @configuration = FrontendConfiguration.first
  end

  def update
    @configuration = FrontendConfiguration.first
    if params.key?(:frontend_configuration) && 
       @configuration.update(frontend_config_params)
      flash[:notice] = t('actions.update')
    else
      flash.now[:alert] = t('actions.error')
      render :save_error
    end
  end

  private

  def frontend_config_params
    params.require(:frontend_configuration).permit(:image)
  end
end
