require 'rails_helper'

describe 'as a user with a created letter' do 
  it 'i can see a preview of that letter' do 
    Letter.create(user_uid: "3", letter_body: "hey", status: "draft")

    visit root_path
    click_on "Preview" 

    expect(page).to have_content("Dear Mr. President,")
    expect(page).to have_content("hey")
    expect(page).to have_content("Preview")
  end

  # it 'i can order the letter' do 

  # end
end