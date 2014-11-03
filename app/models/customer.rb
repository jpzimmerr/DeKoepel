class Customer < ActiveRecord::Base
	has_many :reservations
	belongs_to :company
	

end
