class Reservation < ActiveRecord::Base
	belongs_to :customer

	def self.search(query)
		where("date like ?", "%#{query}%")
	end
end
