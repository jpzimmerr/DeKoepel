class Product < ActiveRecord::Base
	validates :name, :price, presence: true
	def self.search(q)
		q = "%#{q.upcase}"
		where("upper(name) LIKE ?", q)
	end
end
