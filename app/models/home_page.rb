class HomePage < ApplicationRecord
    validates :heading, presence: true
    validates :summary, presence: true
    has_one_attached :slider_image_1
    has_one_attached :slider_image_2
    has_one_attached :slider_image_3
    has_one_attached :slider_image_4
    has_one_attached :slider_image_5
end
