module ApplicationHelper
  def flash_class(name)
    alert_type = case name.to_s
      when 'notice'
        'alert-success'
      when 'error'
        'alert-danger'
      when 'alert'
        'alert-danger'
      when 'info'
        'alert-info'
      when 'warning'
        'alert-warning'
    else
      "alert-#{name}"
    end
    alert_type
  end
end
