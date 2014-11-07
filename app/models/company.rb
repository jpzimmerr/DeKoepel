class Company < ActiveRecord::Base
	has_one :customer, dependent: :destroy

	belongs_to :reservation
	accepts_nested_attributes_for :reservation
end
