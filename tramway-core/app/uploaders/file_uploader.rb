class FileUploader < ApplicationUploader
  include ImageSizes

  def extension_white_list
    %w(pdf doc docx xls csv xlsx jpg)
  end
end
