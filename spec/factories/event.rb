FactoryBot.define do
    factory :event do
        title { "Hello world" }
        status { "InReview" }
        description { "In this post, I’d like to record for willing readers and .." }
        city { "Gondal" }
    end
end 