class Surgery < ApplicationRecord
  validates_presence_of :title, :day, :room

  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def most
    # require "pry"; binding.pry
    # doctors.order(years: :desc).limit(1)
    doctors.order(years: :desc).first
  end

  def least
    # require "pry"; binding.pry
    # doctors.order(:years).limit(1)
    doctors.order(:years).first
  end
end
