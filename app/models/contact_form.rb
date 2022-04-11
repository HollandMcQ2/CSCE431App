class ContactForm < ApplicationRecord
	validates :message, presence: true
end
