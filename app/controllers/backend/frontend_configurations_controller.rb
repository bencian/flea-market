class Backend::FrontendConfigurationsController < BackendController
  def index
    @sliders = SlidersPresenter.new(params)
    @configuration = FrontendConfiguration.first
  end

  def edit
  end

  def update
  end
end
