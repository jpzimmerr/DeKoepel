class Reservation < ActiveRecord::Base
	#before_save :convert_to_datetime

	Reservation.eager_load(:customers, :companies)

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

	def self.filter(f)
		f = "%#{f.strip}%"
		where("started_at LIKE ?", f)
	end

	def self.search(q)
		q = "%#{q.upcase.strip}%"
		joins(customer: :company).where("
			upper(concat_ws(' ',customers.first_name, customers.last_name)) LIKE ? 
													OR ended_at::text LIKE ? 
													OR upper(companies.name) LIKE ?
													", q, q, q)
	end
end	