require 'aws-sdk-s3'
module AmazonService
    class FileUpload
        def initialize(file)
            @file = file
        end

        def file_upload
            Aws.config.update(region: 'sa-east-1')
            s3_client = Aws::S3::Client.new(region: 'sa-east-1')
            respone = s3_client.put_object(
                bucket: 'sa-east-1',
                key: "abc.rb", 
                body: @file.read,
                content_type: @file.content_type
            )
        end          
    end
end