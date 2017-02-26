require 'rails_helper'

describe 'As a visitor' do 
  scenario 'I cannot create a letter' do 
    visit root_path

    expect(page).to have_content("Login/Signup with Facebook")
    expect(page).not_to have_content("Write A Letter")
  end
end