require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'Agasha', photo: '', bio: 'Software developer', posts_counter: 0)
    @post = Post.create(
      title: 'Post title',
      text: 'Post text',
      comments_counter: 0,
      likes_counter: 0
    )
    Comment.create(text: 'Happy coding')
    Comment.create(text: 'Good job team')
    Comment.create(text: 'Status approved!')
  end

  describe 'GET /index' do
    before(:each) do
      get user_posts_path(@user)
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('my posts')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get user_posts_path(@user, @post)
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to_not render_template(:show)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('posts')
    end
  end
end
