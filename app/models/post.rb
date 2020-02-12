class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    # validates :lat, :lng, :status, :title, :condition, :description, :image, presence: true
    # validates :image, content_type: ["image/png", "image/jpeg", "image/jpg"]
end
