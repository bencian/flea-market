module Backend
  class MainController < BackendController
    def index
      render plain: "OK"
    end
  end
end
