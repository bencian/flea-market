module ApplicationHelper
  def get_flash_class(key)
    case key.to_sym
    when :notice
      'success'
    when :alert
      'danger'
    end
  end
end
