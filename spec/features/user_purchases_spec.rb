require 'rails_helper'

describe 'as a user with a created letter' do 
  it 'i can see a preview of that letter' do 
    user = User.create(name: "Nick", uid: "1234")
    Letter.create(user_uid: user.uid, letter_body: "hey", status: "draft")

    page.set_rack_session(user_id: user.uid)
    visit root_path
    
    click_on "Preview / Purchase" 

    expect(page).to have_content("hey")
    expect(page).to have_content("1234")
    expect(page).to have_content("preview")
  end

  it 'i can order the letter' do 
    user = User.create(name: "Nick", uid: "1234")
    letter = Letter.create(user_uid: user.uid, letter_body: "hey", status: "draft")

    page.set_rack_session(user_id: user.uid)

    visit new_purchase_path(:letter_id => letter.id)

    click_on "Place Order"

    expect(page).to have_content(letter.letter_body)
    expect(page).to have_content("Sincerely,")
    expect(page).to have_content(user.name)
  end

  # it 'has sad path for order placement' do 

  # end
end