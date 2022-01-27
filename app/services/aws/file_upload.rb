$.unshift __File__
module AwsServices
    class FileServices
        def initialize(file)
            @file = file
        end

        def file_upload
            s3_client = Aws::S3::Client.new(region: AWS['AWS_REGION'])
            respone = s3_client.put_object(
                bucket: AWS['AWS_REGION'],
                key: "abc.rb", 
                body: @file.read,
                content_type: @file.content_type
            )
        end          
    end
end