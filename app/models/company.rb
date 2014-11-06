class Company < ActiveRecord::Base
	has_one :customer, dependent: :destroy
end
