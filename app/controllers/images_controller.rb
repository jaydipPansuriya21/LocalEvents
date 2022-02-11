class ImagesController <  ApplicationController
    def upload_image
        if params[:image_name]
            file_object = params[:image_name]
            store_file(file_object)
            ImageUploadJob.perform_later file_object.original_filename, params[:id], params[:type] 
            render json: { Message: "Image is being uploading in background"}
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

    def store_file(file_object)
        dir = Rails.root.join('public', 'uploads')
        Dir.mkdir(dir) unless Dir.exist?(dir)
        File.open(dir.join(file_object.original_filename), 'wb') do |file|
            file.write(file_object.read)
        end
    end

end