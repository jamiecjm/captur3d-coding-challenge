module ApplicationHelper

  def flash_class(level)
      case level
          when :notice then "alert alert-info"
          when :success then "alert alert-success"
          when :error then "alert alert-danger"
          when :alert then "alert alert-warning"
      end
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "#{flash_class(msg_type.to_sym)} fade in") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end

  def error_message
    'I\'m sorry, we are currently experiencing system problems and are unable to process your request. Please try again later'
  end
end
