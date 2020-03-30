require 'rails_helper'

feature 'can see foods' do

  it 'user searches ingredient', :vcr do
    visit "/"

    within ".search" do
      fill_in "query", with: 'sweet potatoes'
    end 
  end
end
