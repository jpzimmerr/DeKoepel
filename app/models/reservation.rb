class Reservation < ActiveRecord::Base
	before_save :convert_to_datetime

	def started_at_date
		started_at.strftime("%d/%m/%Y") if started_at.present?
	end

	def started_at_time
		started_at.strftime("%H:%M") if started_at.present?
	end

	def started_at_date=(date)
		@started_at_date = Date.parse(date).strftime("%Y-%m-%d")
	end

	def started_at_time=(time)
		@started_at_time = Time.parse(time).strftime("%H:%M")
	end

	def ended_at_date
		ended_at.strftime("%d/%m/%Y") if ended_at.present?
	end

	def ended_at_time
		ended_at.strftime("%H:%M") if ended_at.present?
	end

	def ended_at_date=(date)
		@ended_at_date = Date.parse(date).strftime("%Y-%m-%d")
	end

	def ended_at_time=(time)
		@ended_at_time = Time.parse(time).strftime("%H:%M")
	end

	def convert_to_datetime
		self.started_at = DateTime.parse("#{@started_at_date} #{@started_at_time}")
		self.ended_at = DateTime.parse("#{@ended_at_date} #{@ended_at_time}")
	end

	self.per_page = 10

	belongs_to :customer
	accepts_nested_attributes_for :customer

	validates :started_at, :ended_at, :amount, presence: true

	def self.search(query)
		q = "%#{query}%"
		joins(customer: :company).where('started_at::text like ? or ended_at::text like ? or upper(customers.last_name) like ? or upper(customers.first_name) like ? or upper(companies.name) like ?', q, q, q.upcase, q.upcase, q.upcase)
	end
end	