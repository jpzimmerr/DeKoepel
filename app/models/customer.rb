class Customer < ActiveRecord::Base
	has_many :reservations

	belongs_to :company
	accepts_nested_attributes_for :company

	def edit

	end
	
	validates :first_name, :last_name, presence: true, 
										length: { minimum: 1, maximum: 20 }
	validates :phone, numericality: true, presence: true,
										length: { minimum: 7 }
	validates_format_of :email, presence: true, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	def self.search(cq)
		cq = "%#{cq.upcase.strip}%"
		joins(:company).where("upper(concat_ws(' ',first_name, last_name)) LIKE ?  
																	OR upper(email) LIKE ?
																	OR upper(companies.name) LIKE ?
																	", cq, cq, cq)
	end
end
