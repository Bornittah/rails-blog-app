require 'rails_helper'
# User index page:
# I can see the username of all other users.
# I can see the profile picture for each user.
# I can see the number of posts each user has written.
# When I click on a user, I am redirected to that user's show page.


before :each do
  @user = User.create(name: 'pius', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 0,
                      bio: 'Dummy text for testing')
  @first_post = Post.create(title: 'Hello', body: 'This is a post text', likes_counter: 0, comments_counter: 0,
                            author_id: @user.id)
  5.times do |_i|
    @comment = Comment.create(text: 'I liked your post!!', author_id: @user.id, post_id: @first_post.id)
  end
  visit user_posts_path(@user)
end
