module Frontend
  class MainController < FrontendController
    def index
      @sliders = Slider.all
      @products = Product.limit(4).order('RAND()')
    end
  end
end
