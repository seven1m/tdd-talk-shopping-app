module ApplicationHelper
  def error_messages_for(form)
    if form.respond_to?(:object)
      obj = form.object
    else
      obj = form
    end
    error_messages_for_object(obj)
  end

  def error_messages_for_object(obj)
    return if obj.errors.empty?
    content_tag(:div, class: 'alert alert-danger') do
      content_tag(:h4, 'There were errors') +
      content_tag(:ul, class: 'list') do
        obj.errors.map do |attribute, message|
          content_tag(:li, "#{attribute} #{message}", data: { attribute: "#{obj.class.name.underscore}_#{attribute}" })
        end.join.html_safe
      end
    end
  end
end
