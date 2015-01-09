class Product < ActiveRecord::Base
	def self.search(q)
		q = "%#{q.upcase}"
		where("upper(name LIKE ?)", q)
	end
end
