require 'rails_helper'

describe 'User logs in via Facebook Oauth' do 
  scenario 'and can see option to create letter' do 
    user = User.create(name: "Nick", uid: "1234")
    
    page.set_rack_session(user_id: user.uid)

    visit root_path
    
    expect(page).to     have_content("Sign Out")
    expect(page).to     have_content("Draft a letter")
    expect(page).not_to have_content("Login with Facebook")
  end

  scenario 'and can logout' do 
    user = User.create(name: "Nick", uid: "1234")
    
    page.set_rack_session(user_id: user.uid)

    visit root_path

    expect(page).to have_content("Draft a letter")
    click_on "Sign Out"

    expect(page).to have_content("Login/Signup with Facebook")
  end
end