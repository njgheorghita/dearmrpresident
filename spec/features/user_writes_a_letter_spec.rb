require 'rails_helper'

describe 'As a logged in user' do 
  it 'I can draft up a letter' do 
    visit new_letter_path

    fill_in "letter_body", with: "Cat's are Nice"

    click_on "Submit"

    expect(page).to have_content("Cat's are Nice")
  end
end