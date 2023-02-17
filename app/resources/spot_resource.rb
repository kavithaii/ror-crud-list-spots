class SpotResource < JSONAPI::Resource
    attributes :title, :description, :price, :list_of_images

    has_many :reviews
end
