FactoryBot.define do
    factory :event do
        title { "Hello world" }
        status { "Pending" }
        description { "In this post, I’d like to record for willing readers and .." }
        city { "Gondal" }
    end    
end 