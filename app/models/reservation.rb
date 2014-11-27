class Reservation < ActiveRecord::Base
	belongs_to :customer
	accepts_nested_attributes_for :customer

	validates :date, :start, :end, presence: true

	def self.search(query)
		q = "%#{query}%"
		joins(:customer).where('date::text like ? or upper(customers.last_name) like ?', q, q.upcase)
		
	end
end	