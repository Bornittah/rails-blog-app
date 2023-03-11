require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Association Test' do
    it { should belong_to(:author) }
    it { should belong_to(:post) }
  end

  describe 'Tests Comment model' do
    User.create(name: 'Tiina', photo: 'https://unsplash.com/photos/6PP8DrhY0aA', bio: 'Coding girl')
    post = Post.create(author: subject, title: 'Intro', text: 'Welcome to this blog!')

    subject { Comment.new }
    before { subject.save }

    it 'Test comments_counter' do
      post.comments_conter = 3
      subject.post = post
      expect(subject.post.comments_conter).to eq 3
    end
  end
end
