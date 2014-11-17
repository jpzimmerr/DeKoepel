class Reservation < ActiveRecord::Base
	config.time_zone = 'Europe/Amsterdam'

	belongs_to :customer
	accepts_nested_attributes_for :customer

	has_many :companies, dependent: :destroy

	validates :date, :start, :end, presence: true
end
