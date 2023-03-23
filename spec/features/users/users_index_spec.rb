require 'rails_helper'
RSpec.describe 'Users Index Page', type: :feature do
  before :each do
    @user1 = User.create(name: 'simon', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'bio 1.')
    @user2 = User.create(name: 'jane', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'bio 2.')
    @post_one = Post.create(author: @user1, title: 'title 1', body: 'post 1')
    @post_two = Post.create(author: @user2, title: 'title 2', body: 'post 2')
  end
  scenario 'display all users names' do
    visit '/'
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end
  scenario 'display post counter' do
    visit '/'
    expect(page).to have_content(@user1.posts_counter)
  end
  scenario 'display user picture' do
    visit '/'
    expect(page).to have_css('img')
  end
  scenario 'shows post show page when it\'s clicked' do
    visit '/'
    click_link(@user1.name)
    expect(page).to have_current_path(user_path(id: @user1.id))
  end
end
