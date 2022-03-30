class HomePage < ApplicationRecord
    validates :heading, presence: true
    validates :summary, presence: true
end
