require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'should show a list of all the pets' do
    shelter1 = Shelter.create!(name: "Joe's Shelter", address: "123 Main St.", city: "Dallas", state: "TX", zip: "75341")
    pet1 = shelter1.pets.create!(name: "Tron",
                       image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13002248/GettyImages-187066830.jpg",
                       age: 3,
                       sex: "Male")
    pet2 = shelter1.pets.create!(name: "Kat",
                      image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13002248/GettyImages-187066830.jpg",
                      age: 2,
                      sex: "Female")

    visit '/pets'

    within ".pets-#{pet1.id}" do
      expect(page).to have_content(pet1.name)
      expect(page).to have_css("img[src*='#{pet1.image}']")
      expect(page).to have_content(pet1.age)
      expect(page).to have_content(pet1.sex)
      expect(page).to have_content(pet1.shelter.name)
    end

    within ".pets-#{pet2.id}" do
      expect(page).to have_content(pet2.name)
      expect(page).to have_css("img[src*='#{pet2.image}']")
      expect(page).to have_content(pet2.age)
      expect(page).to have_content(pet2.sex)
      expect(page).to have_content(pet2.shelter.name)
    end

  end
end
