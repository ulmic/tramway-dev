module Tramway::Core::Concerns::AttributesDecoratorHelper
  def date_view(value)
    I18n.l value.to_date if value
  end

  def datetime_view(value)
    I18n.l value if value
  end

  def state_machine_view(object, attribute_name)
    object.send "human_#{attribute_name}_name"
  end

  def image_view(value)
    content_tag(:div) do
      if value.url.match(/jpg|JPG|png|PNG$/)
        concat image_tag value.try(:small) ? value.small.url : value.url
      end
      concat link_to(fa_icon(:download), value.url, class: 'btn btn-success')
    end
  end

  def enumerize_view(value)
    value.text
  end
end
