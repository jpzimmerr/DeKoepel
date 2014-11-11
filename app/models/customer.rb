class Customer < ActiveRecord::Base
	has_one :reservation, dependent: :destroy

	belongs_to :company
	accepts_nested_attributes_for :company
	
	validates :first_name, :last_name, presence: true, 
										length: { minimum: 1, maximum: 20 }
	validates :phone, numericality: true, presence: true,
										length: { minimum: 7 }
	validates_format_of :email, presence: true, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
