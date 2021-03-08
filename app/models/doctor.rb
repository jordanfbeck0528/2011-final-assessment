class Doctor < ApplicationRecord
  validates_presence_of :name, :years, :university

  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries

  def self.years_practiced
    all.order(years: :desc)
  end
end
