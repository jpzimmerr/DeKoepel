class Reservation < ActiveRecord::Base

	filterrific(
		filter_names: [
			:date,
			])

	scope :with_date, lambda { |reference_time|
		where('reservation.date >= ?', reference_time) 
	}

	self.per_page = 10

	belongs_to :customer
	accepts_nested_attributes_for :customer

	validates :date, :start, :end, presence: true

	def self.search(query)
		q = "%#{query}%"
		joins(customer: :company).where('date::text like ? or upper(customers.last_name) like ? or upper(customers.first_name) like ? or upper(companies.name) like ?', q, q.upcase, q.upcase, q.upcase)
	end
end	