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


# RSpec.describe 'User', type: :feature do
#   include Devise::Test::IntegrationHelpers
#   fixtures :all
#   scenario 'shows logged out view' do
#     sign_in users(:owner)
#     expect(page).to have_content("Attendance")

#   end
# end