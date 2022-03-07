require 'rails_helper'
require 'omniauth'
require 'user'

RSpec.describe 'Home Page', type: :feature do
  scenario 'shows logged out view' do
    visit root_url
    expect(page).to have_content('Home')
    expect(page).to have_content('About Us')
    expect(page).to have_content('Events')
    expect(page).to have_content('Contact Us')
    expect(page).to have_selector ".btn-primary"
  end
end

# RSpec.describe 'Nav Bar Logged In', type: :feature do
#   scenario 'Log In' do
#     visit new_user_session_url
#     expect(page).to have_content('Home')
#     expect(page).to have_content('About Us')
#     expect(page).to have_content('Events')
#     expect(page).to have_content('Contact Us')
#     click_button(class: 'btn btn-primary')
#   end
# end