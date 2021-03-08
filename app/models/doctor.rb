class Doctor < ApplicationRecord
  validates_presence_of :name, :years, :university

  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries

  def self.years_practiced
    all.order(years: :desc)
  end

  # def self.most
  #   order(years: :desc).pluck.first
  # end
  #
  # def self.least
  #   require "pry"; binding.pry
  #   order(:years).pluck.first
  # end
end
