class Reservation < ActiveRecord::Base
	belongs_to :customer
	accepts_nested_attributes_for :customer

	validates :date, :start, :end, presence: true

	q = "%#{query}%"
	Reservation.joins(:customer).where('customers.last_name = ?', q)

	def self.search(query)
		where('date like ? OR last_name like ? OR name like ?', query, query, query)
	end
end	