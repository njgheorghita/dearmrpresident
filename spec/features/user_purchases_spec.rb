require 'rails_helper'

describe 'as a user with a created letter' do 
  it 'i can see a preview of that letter' do 
    user = User.create(name: "Nick", uid: "1234")
    Letter.create(user_uid: user.uid, letter_body: "hey", status: "draft")

    page.set_rack_session(user_id: user.uid)
    visit root_path
    
    click_on "Preview / Purchase" 

    expect(page).to have_content("hey")
    expect(page).to have_content("Nick")
    expect(page).to have_content("preview")
  end

  xit 'i can create a letter order' do 
    user = User.create(name: "Nick", uid: "1234")
    letter = Letter.create(user_uid: user.uid, letter_body: "hey", status: "draft")
    page.set_rack_session(user_id: user.uid)

    visit new_purchase_path(:letter_id => letter.id)

    fill_in "from_address_line", with: "address"
    fill_in "from_address_zip", with: "zip"
    fill_in "data", with: "email"
    

    click_on "Place Order"
    expect(page).to have_content("checkout")
    expect(page).to have_content("Sincerely,")
    expect(page).to have_content(user.name)
  end

  it 'has sad path for order placement' do 
    user = User.create(name: "Nick", uid: "1234")
    letter = Letter.create(user_uid: user.uid, letter_body: "hey", status: "draft")
    page.set_rack_session(user_id: user.uid)

    visit new_purchase_path(:letter_id => letter.id)

    # fill_in "name", with: ""
    
    click_on "Place Order"
    expect(page).to have_content("all fields must be filled out")
    expect(page).to have_content("Sincerely,")
    expect(page).not_to have_content("checkout")
  end
end