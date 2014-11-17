class Customer < ActiveRecord::Base
	has_many :reservations

	belongs_to :company
	accepts_nested_attributes_for :company
end
