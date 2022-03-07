require 'rails_helper'

RSpec.describe 'Initial Page', type: :feature do
  scenario 'shows Home Page' do
    visit new_user_session_url
    expect(page).to have_content('Home')

  end
end