require 'rails_helper'

describe 'As a logged in user' do 
  it 'I can draft up a letter' do 
    user = User.create(name: "Nick", uid: "1234")
    page.set_rack_session(user_id: user.uid)

    visit new_letter_path

    fill_in "letter_body", with: "Cat's are Nice"

    click_on "Submit"

    expect(page).to have_content("Cat's are Nice")
  end
end