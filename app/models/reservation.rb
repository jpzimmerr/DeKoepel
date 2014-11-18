class Reservation < ActiveRecord::Base
	belongs_to :customer
	accepts_nested_attributes_for :customer

	validates :date, :start, :end, presence: true

	def self.search(query)
		where("date like ?", "%#{query}%")
	end
end
