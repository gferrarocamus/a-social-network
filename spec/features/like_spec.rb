# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Like button', type: :feature do
  before do
    @user = create(:user)
    @friend = create(:user)
    create(:friendship, active_friend: @user, passive_friend: @friend)
    create(:post, user: @friend)
  end

  scenario 'should allow liking/unliking posts' do
    login_as(@user)
    visit root_path
    click_link 'thumb_up'
    expect(page).to have_text('1 like')
    expect(page).to have_css('i.material-icons.like.liked')
    click_link 'thumb_up'
    expect(page).to have_text('0 likes')
    expect(page).not_to have_css('i.material-icons.like.liked')
  end
end
