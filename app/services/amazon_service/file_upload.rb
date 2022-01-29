require 'aws-sdk-s3'
module AmazonService
    class FileUpload
        def initialize(file)
            @file = file
        end

        def file_upload
            Aws.config.update(region: ENV['AWS_REGION'])
            s3_client = Aws::S3::Client.new(region: ENV['AWS_REGION'])
            respone = s3_client.put_object(
                bucket: 'jaydip21',
                key: get_name_for_imag, 
                body: @file.read,
                content_type: @file.content_type
            )
        end
        
        def file_delete(image_name)
            s3 = Aws::S3::Resource.new(region: 'sa-east-1')
            obj = s3.bucket('jaydip21').object(name)
            obj.delete
            true
        end

        def get_name_for_imag
            SecureRandom.hex(4) 
        end
    end
end