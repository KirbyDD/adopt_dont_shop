require 'rails_helper'

RSpec.describe 'As a visitor to a shelters pets show page', type: :feature do
  before(:each) do
    @shelter1 = Shelter.create!(name: "Joe's Shelter", address: "123 Main St.", city: "Dallas", state: "TX", zip: "75341")
    @shelter2 = Shelter.create!(name: "Jane's Shelter", address: "321 2nd St.", city: "Denver", state: "CO", zip: "80020")

    @pet1 = @shelter1.pets.create!(name: "Tron",
                       image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13002248/GettyImages-187066830.jpg",
                       approximate_age: 3,
                       sex: "Male",
                       description: 'Too Cool for School')
    @pet2 = @shelter1.pets.create!(name: "Kat",
                      image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13002248/GettyImages-187066830.jpg",
                      approximate_age: 2,
                      sex: "Female",
                      description: 'Too Cool for School')
    @pet3 = @shelter2.pets.create!(name: "Peppo",
                       image: "https://adopt-dont-shop.s3-us-west-1.amazonaws.com/images/mexican_hairless_105.jpg",
                       approximate_age: 5,
                       sex: "Male",
                       description: 'Too Cool for School')
  end

  it 'should only show pets from that shelter' do
    visit "/shelters/#{@shelter1.id}/pets"

    expect(page).to have_content(@pet1.name)
    expect(page).to have_css("img[src*='#{@pet1.image}']")
    expect(page).to have_content(@pet1.approximate_age)
    expect(page).to have_content(@pet1.sex)

    expect(page).to have_content(@pet2.name)
    expect(page).to have_css("img[src*='#{@pet2.image}']")
    expect(page).to have_content(@pet2.approximate_age)
    expect(page).to have_content(@pet2.sex)

    expect(page).to_not have_content(@pet3.name)
    expect(page).to_not have_css("img[src*='#{@pet3.image}']")
    expect(page).to_not have_content(@pet3.approximate_age)
  end
end
