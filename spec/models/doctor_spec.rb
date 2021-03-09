require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :years }
    it { should validate_presence_of :university }
  end

  describe "relationships" do
    it { should have_many :doctor_surgeries }
    it { should have_many(:surgeries).through(:doctor_surgeries) }
  end
  describe "class methods" do
    it "can print years practiced for all doctors" do
      DoctorSurgery.destroy_all
      Surgery.destroy_all
      Doctor.destroy_all

      @doctor_1 = Doctor.create!(name: "Jim", years: 15 , university: "Brown")
      @doctor_2 = Doctor.create!(name: "Kat", years: 20 , university: "Harvard")
      @doctor_3 = Doctor.create!(name: "Ian", years: 25 , university: "Stanford")
# require "pry"; binding.pry
      @surgery_1 = Surgery.create!(title: "brain" , day: "Monday", room: 1)

      @surgery_1.doctors << [@doctor_1, @doctor_2]

      @surgery_2 = @doctor_2.surgeries.create!(title: "shoulder", day: "Tuesday", room: 2)
      @surgery_3 = @doctor_3.surgeries.create!(title: "heart", day: "Wednesday", room: 3)

      expected = [@doctor_3, @doctor_2, @doctor_1]

      expect(Doctor.years_practiced).to eq(expected)
    end
  end
end
