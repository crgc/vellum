module ApplicationHelper
  def show_errors(model)
    pluralize(model.errors.count, 'error') if model.errors.any?
  end

  def show_notice
    content_tag(:div, notice, class: 'notice-box') if notice
  end

  def show_alert
    content_tag(:div, alert, class: 'alert-box') if alert
  end

  def friendly_date(date)
    date.stamp('11 Oct 1990')
  end
end
