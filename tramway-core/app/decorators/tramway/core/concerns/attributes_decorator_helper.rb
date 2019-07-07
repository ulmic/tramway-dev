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
      begin
        if value.url.match(/jpg|JPG|png|PNG$/)
          concat image_tag value.try(:small) ? value.small.url : value.url
        end
      rescue NoMethodError => e
        error = Tramway::Error.new plugin: :core, method: :image_view, message: e.name == :url ? 'You should mount PhotoUploader to your model. Just add `mount_uploader #{attribute_name}, PhotoUploader` to your model' : e.message
        raise error.message
      end
      concat link_to(fa_icon(:download), value.url, class: 'btn btn-success')
    end
  end

  def enumerize_view(value)
    value.text
  end
end
