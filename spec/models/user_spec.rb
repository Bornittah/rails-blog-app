require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Aine', photo: 'https://unsplash.com/photos/6PP8DrhY0aA', bio: 'Boy child.') }

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Posts Counter attribute should be an integer' do
    subject.posts_counter = 'string'
    expect(subject).to_not be_valid
  end

  it 'Posts Counter attribute should be greater or equal to zero' do
    subject.posts_counter = -100
    expect(subject).to_not be_valid
  end

  describe '#three_recent_posts' do
    before { 6.times { Post.create(author: subject, title: 'Intro', text: 'Welcome to this blog!') } }

    it 'three_recent_posts should return 3 posts' do
      expect(subject.three_recent_posts.size).to eql(subject.posts.last(3).size)
    end
  end
end
