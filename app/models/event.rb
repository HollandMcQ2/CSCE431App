class Event < ApplicationRecord
    validates :name, presence: true

	has_many :event_user #creates relationship with event-user join table
end
