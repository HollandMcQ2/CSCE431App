require 'rails_helper'
require 'omniauth'
require 'user'

RSpec.describe 'Initial Page', type: :feature do
  scenario 'shows Home Page' do
    visit new_user_session_url
    expect(page).to have_content('Home')

  end
end