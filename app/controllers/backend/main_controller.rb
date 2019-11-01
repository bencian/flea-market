module Backend
  class MainController < BackendController
    def index
      # aca deberia redireccionar si no hay sesion
      render plain: "OK"
    end
  end
end
