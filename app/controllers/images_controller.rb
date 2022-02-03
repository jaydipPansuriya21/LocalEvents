class ImagesController <  ApplicationController
    def upload_image
        if params[:image]
            file_service = get_file_service_object(params[:image_name])
            image_name = file_service.file_upload
            @image = Image.new(images_path: image_name)
            @image.save_image_information(params)
        else
            render json: { Error: "Image is not given"}
        end
    end

    def remove_image
        if params[:image_name]
            file_service = get_file_service_object(params[:image_name])
            file_service.file_delete(params[:image_name])
            @image = Image.find_by(images_path: image_name)
            @image.destroy
        else
            render json: { Error: "Image name is not given"}
        end
    end

    
    private 

    def get_file_service_object(file)
        AmazonService::FileUpload.new(file)
    end

end