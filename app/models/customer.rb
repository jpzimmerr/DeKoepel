class Customer < ActiveRecord::Base
	has_many :reservations

	belongs_to :company
	accepts_nested_attributes_for :company

	def self.options_for_select
		order('LOWER(last_name)').map { |e| [e.last_name, e.id]}
	end
	def edit

	end
	validates :first_name, :last_name, presence: true, 
										length: { minimum: 1, maximum: 20 }
	validates :phone, numericality: true, presence: true,
										length: { minimum: 7 }
	validates_format_of :email, presence: true, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
