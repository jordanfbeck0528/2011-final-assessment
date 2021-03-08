class Surgery < ApplicationRecord
  validates_presence_of :title, :day, :room

  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries
end
