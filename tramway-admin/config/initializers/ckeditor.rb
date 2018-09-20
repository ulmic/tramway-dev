Ckeditor.setup do |config|
  require "ckeditor/orm/active_record"

  config.assets_plugins = [ 'image', 'copyformatting', 'filebrowser', 'sourcedialog' ]
end
