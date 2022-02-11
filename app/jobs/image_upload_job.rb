class ImageUploadJob < ApplicationJob
  queue_as :default

  def perform(*args)
    file_path = ENV['STORAGE_LOCATION']+args[0]
    info_hash = {}
    info_hash[:id] = args[1]
    info_hash[:type] = args[2]

    file_service = get_file_service_object(file_path)
    image_name = file_service.file_upload
    
    @image = Image.new(images_path: image_name)
    @image.save_image_information(info_hash)
    File.delete(file_path)
  end

  private 

  def get_file_service_object(file_path)
      AmazonService::FileUpload.new(file_path)
  end

end
