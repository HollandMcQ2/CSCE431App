class PaymentAccount < ApplicationRecord
	validates :internal_name, presence: true
	validates :payment_address, presence: true
end
