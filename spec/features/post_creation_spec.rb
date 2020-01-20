# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Post creation', type: :feature do
  before do
    @user = create(:user)
    login_as(@user)
  end

  scenario 'successful with correct data' do
    visit new_post_path
    fill_in 'post_content', with: 'New post'
    click_button 'Post'
    expect(page).to have_text('Post created successfully')
  end

  scenario 'successful with picture' do
    visit new_post_path
    fill_in 'post_content', with: 'New post with image'
    attach_file('post_picture', Rails.root + 'spec/fixtures/social.png')
    click_button 'Post'
    expect(page).to have_text('Post created successfully')
  end

  scenario 'unsuccessful without content' do
    visit new_post_path
    fill_in 'post_content', with: ''
    click_button 'Post'
    expect(page).to have_text('Could not create post:')
  end
end
