class Reservation < ActiveRecord::Base
	belongs_to :customer
	accepts_nested_attributes_for :customer

	validates :date, :start, :end, presence: true

	Reservation.joins(customers: :last_name)

	def self.search(query)
		where('date like ? OR last_name like ? OR name like ?', query, query, query)
	end
end