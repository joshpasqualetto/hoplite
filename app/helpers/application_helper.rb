module ApplicationHelper
  def flash_messages(flash)
    %w(notice warning error).collect { |message|
      unless flash[message.to_sym].blank?
        content_tag(:p, flash[message.to_sym], :class => "flash " + message)
      end 
    }.join
  end
end
