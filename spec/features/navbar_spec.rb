# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Navbar', type: :feature do
  before do
    @user = create(:user)
  end

  scenario 'displays links for users not signed in' do
    visit root_path
    expect(page).to have_link('A Social Network')
    expect(page).not_to have_link('Log Out')
  end

  scenario 'displays links for signed-in users' do
    login_as(@user)
    visit root_path
    expect(page).to have_link('Social Network')
    expect(page).to have_link(@user.name)
    expect(page).to have_link('Find Friends')
    expect(page).to have_link('Notifications person_add')
    expect(page).to have_link('Log Out')
  end
end
