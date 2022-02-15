require 'rails_helper'

RSpec.describe 'Initial Page', type: :feature do
  scenario 'valid inputs' do
    visit new_user_session_url
    expect(page).to have_content('Please Sign In')

  end
end