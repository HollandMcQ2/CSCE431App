require 'rails_helper'
require 'omniauth'
require 'user'

RSpec.describe 'Home Page', type: :feature do
  before(:all) do
    if HomePage.count < 1 #needed because the test database resets after every single test and deletes seed
      @homepage = HomePage.create(:heading => 'Howdy', :summary => 'Hello');
    end
  end
  scenario 'shows logged out view' do
    visit root_url
    expect(page).to have_content('Home')
    expect(page).to have_content('About Us')
    expect(page).to have_content('Events')
    expect(page).to have_content('Contact Us')
    expect(page).to have_selector ".btn-primary"
  end
end


RSpec.describe('Authentication', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    unless User.where(email: 'userdoe@example.com').first.nil? == false
      User.create(:full_name => 'User Doe', :email => "userdoe@example.com");
    end
  end

  it 'Sign in with valid credentials' do
    visit root_path

    # sign in and verify sign in
    click_on 'Sign in with Google'
    expect(page).to(have_content('Successfully authenticated from Google account.'))
  end
end