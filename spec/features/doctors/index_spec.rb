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
# save_and_open_page
    expected_1 = [@doctor_3.name, @doctor_3.years, @doctor_3.university]
    expected_2 = [@doctor_2.name, @doctor_2.years, @doctor_2.university]
    expected_3 = [@doctor_1.name, @doctor_1.years, @doctor_1.university]


    expect(page).to have_content(expected_1)
    expect(page).to have_content(expected_2)
    expect(page).to have_content(expected_3)
  end
end
