require 'rails_helper'

RSpec.describe 'As a user, when I visit the Doctor index', type: :feature do
  before :each do

    @doctor_1= Doctor.create!(name: "Jim", years: 15 , university: "Brown")
    @doctor_2= Doctor.create!(name: "Kat", years: 20 , university: "Harvard")
    @doctor_3= Doctor.create!(name: "Ian", years: 25 , university: "Stanford")

    @surgery_1 = @doctor_1.surgeries.create!(title: "brain" , day: "Monday", room: 1)
    @surgery_2 = @doctor_2.surgeries.create!(title: "shoulder", day: "Tuesday", room: 2)
    @surgery_3 = @doctor_3.surgeries.create!(title: "heart", day: "Wednesday", room: 3)
  end

  it 'I see the all Doctors including their name, years practiced, and university
    And I see that the doctors are listed in order of years practiced from most to least' do

    visit doctors_path
save_and_open_page
    within("#doctor-#{@doctor_3.id}") do
      expect(page).to have_content(@doctor_3.name)
      expect(page).to have_content(@doctor_3.years)
      expect(page).to have_content(@doctor_3.university)
    end

    within("#doctor-#{@doctor_2.id}") do
      expect(page).to have_content(@doctor_2.name)
      expect(page).to have_content(@doctor_2.years)
      expect(page).to have_content(@doctor_2.university)
    end

    within("#doctor-#{@doctor_1.id}") do
      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_1.years)
      expect(page).to have_content(@doctor_1.university)
    end

    expect(@doctor_3.name).to appear_before(@doctor_2.name)
    expect(@doctor_2.name).to appear_before(@doctor_1.name)
  end
end
