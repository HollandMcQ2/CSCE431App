require 'rails_helper'
require 'omniauth'
require 'user'

RSpec.describe 'Initial Page', type: :feature do
  scenario 'shows Sign in' do
    visit new_user_session_url
    expect(page).to have_content("Please Sign In")
  end
end