require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'should show a list of all the pets' do
    shelter1 = Shelter.create!(name: "Joe's Shelter", address: "123 Main St.", city: "Dallas", state: "TX", zip: "75341")
    pet1 = shelter1.pets.create!(name: "Tron",
                       approximate_age: 3,
                       sex: "Male",
                       description: 'Too Cool for School')
    pet2 = shelter1.pets.create!(name: "Kat",
                      approximate_age: 2,
                      sex: "Female",
                      description: 'Too Cool for School')

    visit '/pets'

    within ".pets-#{pet1.id}" do
      expect(page).to have_content(pet1.name)
      expect(page).to have_css("img[src*='#{pet1.image}']")
      expect(page).to have_content(pet1.approximate_age)
      expect(page).to have_content(pet1.sex)
      expect(page).to have_content(pet1.shelter.name)
    end

    within ".pets-#{pet2.id}" do
      expect(page).to have_content(pet2.name)
      expect(page).to have_css("img[src*='#{pet2.image}']")
      expect(page).to have_content(pet2.approximate_age)
      expect(page).to have_content(pet2.sex)
      expect(page).to have_content(pet2.shelter.name)
    end

  end
end
