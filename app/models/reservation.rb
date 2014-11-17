class Reservation < ActiveRecord::Base
	belongs_to :customer
	accepts_nested_attributes_for :customer

	def self.search(query)
		where("date like ?", "%#{query}%")
	end
end
