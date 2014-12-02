class Reservation < ActiveRecord::Base

	self.per_page = 10

	belongs_to :customer
	accepts_nested_attributes_for :customer

	validates :started_at, :ended_at, :amount, presence: true

	def self.search(query)
		q = "%#{query}%"
		joins(customer: :company).where('started_at::text like ? or ended_at::text like ? or upper(customers.last_name) like ? or upper(customers.first_name) like ? or upper(companies.name) like ?', q, q, q.upcase, q.upcase, q.upcase)
	end
end	