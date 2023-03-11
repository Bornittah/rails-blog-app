require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Associations' do
    it { should belong_to(:author) }
    it { should belong_to(:post) }
  end
  describe 'Tests for Like model' do
    User.create(name: 'Tiina', photo: 'https://unsplash.com/photos/6PP8DrhY0aA', bio: 'Coding girl')
    post = Post.create(author: subject, title: 'Intro', text: 'Welcome to this blog!')

    subject { Like.new }
    before { subject.save }

    it '#update_post_likes_counter' do
      post.likes_counter = 2
      subject.post = post
      expect(subject.post.likes_counter).to eq 2
    end
  end
end
