require 'rails_helper'

RSpec.describe 'As a visitor of the Shelter index page' do
  before(:each) do
    @shelter1 = Shelter.create!(name: "Joe's Shelter", address: "123 Main St.", city: "Dallas", state: "TX", zip: "75341")
    @shelter2 = Shelter.create!(name: "Jane's Shelter", address: "321 2nd St.", city: "Denver", state: "CO", zip: "80020")
  end

  it 'should show all the shelters on the index page' do
    visit '/shelters'

    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter2.name)
    expect(page).to have_link("New Shelter")
  end
end
