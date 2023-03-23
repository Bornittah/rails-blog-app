require 'rails_helper'
RSpec.describe 'Users Show Page', type: :feature do
  before :each do
    @user1 = User.create(name: 'user 1', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',  bio: 'bio 1')
    @user2 = User.create(name: 'user 2', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',  bio: 'bio 2')
    @post_one = Post.create(author: @user1, title: 'title 1', body: 'body 1')
    @post_two = Post.create(author: @user2, title: 'title 2', body: 'body 2')
  end
  scenario 'display user name' do
    visit user_path(id: @user1.id)
    expect(page).to have_content(@user1.name)
  end
  scenario 'display user bio' do
    visit user_path(id: @user1.id)
    expect(page).to have_content(@user1.bio)
  end
  scenario ' display user picture' do
    visit user_path(id: @user1.id)
    expect(page).to have_css('img')
  end
  scenario ' display user posts counter' do
    visit user_path(id: @user1.id)
    expect(page).to have_content(@user1.posts_counter)
  end
  scenario ' display users first three posts' do
    visit user_path(id: @user1.id)
    expect(page).to have_content(@post_one.title)
    expect(page).to have_content(@post_one.body)
  end
  scenario 'display link to all posts' do
    visit user_path(id: @user1.id)
    expect(page).to have_link('See all posts')
  end
  scenario 'redirects to the user posts index page when the button is clicked' do
    visit user_path(id: @user1.id)
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user1))
  end
  scenario 'shows post show page when it\'s clicked' do
    visit user_path(id: @user1.id)
    click_link(@post_one.title)
    expect(page).to have_current_path(user_post_path(user_id: @user1.id, id: @post_one.id))
  end
end
