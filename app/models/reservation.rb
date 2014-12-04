class Reservation < ActiveRecord::Base
	#before_save :convert_to_datetime

	filterrific(
		default_settings: { sorted_by: 'created_at_desc'},
		filter_names: [
			:search_query,
			:sorted_by,
			:with_customer_id,
			:with_created_at_gte
			]
		)

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

	def self.options_for_sorted_by
		[
			['Name (a-z)', 'last_name_asc'],
			['Registration date (desc)', 'created_at_desc'],
			['Registration date (asc)', 'created_at_asc'],
			['Customer (a-z)', 'customer_first_name_asc']
		]
	end

	scope :with_customer_id, lambda { |customer_ids| 
		where(customer_id: [*customer_ids])
	}

	scope :sorted_by, lambda { |sort_option|
		direction = (sort_option =~ /desc$/ ) ? 'desc' : 'asc'
		case sort_option.to_s
		when /^created_at_/
			order("customers.created_at #{ direction }")
		when /^name_/
			order("LOWER(customer.last_name) #{ direction }, LOWER(customer.first_name) #{ direction }")
		else
			raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
		end
 	}

	belongs_to :customer
	accepts_nested_attributes_for :customer

	validates :started_at, :ended_at, :amount, presence: true
end	