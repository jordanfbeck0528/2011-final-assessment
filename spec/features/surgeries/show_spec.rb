require 'rails_helper'

RSpec.describe 'As a user, when I visit the surgery show page', type: :feature do
  before :each do

    @doctor_1= Doctor.create!(name: "Jim", years: 15 , university: "Brown")
    @doctor_2= Doctor.create!(name: "Kat", years: 20 , university: "Harvard")
    @doctor_3= Doctor.create!(name: "Ian", years: 25 , university: "Stanford")

    @surgery_1 = @doctor_1.surgeries.create!(title: "brain" , day: "Monday", room: 1)
    # @surgery_1 = @doctor_2.surgeries.create!(title: "brain" , day: "Tuesday", room: 1)

    @surgery_1.doctors << @doctor_2

    @surgery_2 = @doctor_2.surgeries.create!(title: "shoulder", day: "Tuesday", room: 2)
    @surgery_3 = @doctor_3.surgeries.create!(title: "heart", day: "Wednesday", room: 3)
  end

  it "Then I see the surgerys title, day of the week, and operating room number" do

    visit surgery_path(@surgery_1.id)
# save_and_open_page
    within(".surgeries") do
      expect(page).to have_content(@surgery_1.title)
      expect(page).to have_content(@surgery_1.day)
      expect(page).to have_content(@surgery_1.room)
    end
  end

  it "I see the names and years practiced of all doctors performing this surgery
    And I see two sections, one for Most experienced doctor and one for Least experienced doctor
    And in those two sections I see the two doctors who are performing this
    surgery with the most and least years practiced
    in the appropriate section including thier name and their years practiced." do

    visit surgery_path(@surgery_1.id)
save_and_open_page
    within("#doctors-most-ex") do
      expect(page).to have_content(@doctor_2.name)
      expect(page).to have_content(@doctor_2.years)
    end

    within("#doctors-least-ex") do
      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_1.years)
    end
  end

  # it "I see a field with instructions to Add A Doctor To This Surgery
  # When I input the name of an existing Doctor into that field
  # And I click submit
  # I'm taken back to that surgery's show page
  # And I see the name of that doctor listed on the page" do
  #
  #   visit surgery_path(@surgery_1.id)
  #
  #   fill_in 'name', with: 'Megan'
  #   fill_in 'years', with: 'Megan'
  #   fill_in 'university', with: 'Megan'
  #   click_on 'Add Doctor'
  #
  #   expect(current_path).to eq(surgery_path(@surgery_1.id))
  #   expect(page).to have_content('Megan')
  # end
# (Note: you do not need to handle any sad paths)
# (Note: you should not create a new doctor)
end
