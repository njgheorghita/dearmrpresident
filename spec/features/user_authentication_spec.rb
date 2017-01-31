require 'rails_helper'

describe 'User logs in via Facebook Oauth' do 
  scenario 'and can see option to create letter' do 
    user = User.create(name: "Nick")
    page.set_rack_session(user_id: user.id)

    visit root_path

    expect(page).to     have_content("Sign Out")
    expect(page).to     have_content("Write A Letter")
    expect(page).not_to have_content("Login with Facebook")
  end
end