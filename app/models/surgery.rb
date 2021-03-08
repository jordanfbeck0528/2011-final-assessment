class Surgery < ApplicationRecord
  validates_presence_of :title, :day, :room

  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def most
    # require "pry"; binding.pry
    # doctors.order(years: :desc).limit(1)
    doctors.order(years: :desc).pluck.first
  end

  def least
    # require "pry"; binding.pry
    # doctors.order(:years).limit(1)
    doctors.order(:years).pluck.first
  end
end
