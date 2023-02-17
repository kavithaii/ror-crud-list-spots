class ReviewResource < JSONAPI::Resource
    attributes :author, :body

    has_one :spot
end
