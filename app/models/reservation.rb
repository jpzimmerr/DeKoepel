class Reservation < ActiveRecord::Base
	belongs_to :customer
	accepts_nested_attributes_for :customer

	validates :date, :start, :end, presence: true

	#q = "%#{query}%"
	#Reservation.joins(:customer).where('customers.last_name = ?', q)

	#<<-SQL
	#	SELECT reservations.* FROM reservations LEFT OUTER JOIN customers ON customer.last_name = last_name
	#	SELECT reservations.* FROM reservations LEFT OUTER JOIN companies ON company.name = name
	#	SELECT reservations.* FROM reservations ON date = date
	#SQL

	def self.search(query)
		where('date like ? OR last_name like ? OR name like ?', query, query, query)
	end
end	