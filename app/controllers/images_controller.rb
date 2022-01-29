class ImagesController <  ApplicationController
    def upload_image
        if params[:image]
            file_service = AmazonService::FileUpload.new(params[:image]) 
            image_name = file_service.file_upload
            @image = Image.new(images_path: image_name)
            @image.save_image_information(params)
        end
    end

    def remove_image
        if params[:image_name]
            file_service = AmazonService::FileUpload.new(params[:image])
            file_service.file_delete(params[:image_name])
            @image = Image.find_by(images_path: image_name)
            @image.destroy
        end
    end
end