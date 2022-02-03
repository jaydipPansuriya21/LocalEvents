require 'aws-sdk-s3'
module AmazonService
    class FileUpload
        def initialize(file)
            @file = file
            @hexvalue = 4
            Aws.config.update(region: ENV['AWS_REGION'])
        end

        def file_upload
            s3_client = get_client
            image_name = get_name_for_imag
            respone = s3_client.put_object(
                bucket: ENV['S3_BUCKET'],
                key: image_name, 
                body: @file.read,
                content_type: @file.content_type
            )
            image_name
        end
        
        def file_delete(image_name)
            s3_client = get_client
            respone = s3_client.delete_object(
                bucket: ENV['S3_BUCKET'],
                key: image_name 
            )
        end

        
        private

        def get_name_for_imag
            image_name = SecureRandom.hex(@hexvalue) + "." + get_extention 
            image_name
        end

        def get_client
            Aws::S3::Client.new(region: ENV['AWS_REGION'])
        end

        def get_extention 
            temp_list = @file.original_filename.split('.')
            temp_list.last
        end

    end
end