class FrontendController < ApplicationController
  layout 'frontend'

  helper_method :categories
  protected

  def categories
    @categories ||= Category.all
  end
end
