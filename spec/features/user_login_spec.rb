require 'rails_helper'


RSpec.feature "Visitor navigates to log in", type: :feature, js: true do
    before :each do
    User.create!(
      email:"worry@pog.pog",
      password: "pog123456",
      name: "POGWORLD"
      )
    end
  
    scenario "They can log in" do
      visit root_path
      # ACT
      click_link('Login')

      within('form') do 
      fill_in 'Email', with: 'worry@pog.pog'
      fill_in 'Password', with: "pog123456"
    end
      click_button('Login')
        expect(page).to have_content('Signed in as POGWORLD')
      # DEBUG / VERIFY
      save_screenshot
  
    end
  
  end