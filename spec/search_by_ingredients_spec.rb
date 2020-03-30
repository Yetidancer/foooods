require 'rails_helper'

feature 'can see foods' do

  it 'user searches ingredient', :vcr do
    visit "/"

    fill_in "q", with: 'sweet potatoes'

    click_on "Search"

    expect(current_path).to eq(foods_path)

    expect(page).to have_content("10 results")
    expect(page).to have_css(".food", count: 10)

    within(first(".food")) do
      expect(page).to have_css(".code")
      expect(page).to have_css(".description")
      expect(page).to have_css(".owner")
      expect(page).to have_css(".ingredients")

    end
  end
end
