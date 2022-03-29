class HomePage < ApplicationRecord
    validates :slider_image_1, presence: true
    validates :slider_image_2, presence: true
    validates :slider_image_3, presence: true
    validates :slider_image_4, presence: true
    validates :slider_image_5, presence: true
end
