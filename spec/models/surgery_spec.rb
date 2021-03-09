require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :day }
    it { should validate_presence_of :room }
  end

  describe "relationships" do
    it { should have_many :doctor_surgeries }
    it { should have_many(:doctors).through(:doctor_surgeries) }
  end
  describe "instance methods" do
    it "can print most/least experienced doctors" do
      @doctor_1 = Doctor.create!(name: "Jim", years: 15 , university: "Brown")
      @doctor_2 = Doctor.create!(name: "Kat", years: 20 , university: "Harvard")
      @doctor_3 = Doctor.create!(name: "Ian", years: 25 , university: "Stanford")

      @surgery_1 = Surgery.create!(title: "brain" , day: "Monday", room: 1)

      @surgery_1.doctors << [@doctor_1, @doctor_2]

      @surgery_2 = @doctor_2.surgeries.create!(title: "shoulder", day: "Tuesday", room: 2)
      @surgery_3 = @doctor_3.surgeries.create!(title: "heart", day: "Wednesday", room: 3)
  # require "pry"; binding.pry
      expect(@surgery_1.most.name).to eq("Kat")
      expect(@surgery_1.most.years).to eq(20)
      expect(@surgery_1.least.name).to eq("Jim")
      expect(@surgery_1.least.years).to eq(15)
    end
  end
end
