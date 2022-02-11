class ImageUploadJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Image is uploading .."
  end
end
