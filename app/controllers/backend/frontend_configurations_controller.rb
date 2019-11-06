class Backend::FrontendConfigurationsController < BackendController
  def index
    @presenter = SlidersPresenter.new(params)
    @configuration = FrontendConfiguration.first
  end

  def edit
    @configuration = FrontendConfiguration.first
    render :modal
  end

  def update
  end
end
