class Reservation < ActiveRecord::Base
	belongs_to :customer
	accepts_nested_attributes_for :customer

	has_many :companies, dependent: :destroy

	validates :date, :start, :end, presence: true
end
