require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe ':index' do
    before(:each) { get root_path }

    it('status should be :ok') do
      expect(response).to have_http_status(:ok)
    end

    it('rendered :index template') do
      expect(response).to render_template(:index)
    end
  end

  describe ':show' do
    before(:each) do
      @author = User.create(name: 'Agasha', posts_counter: 0, photo: '', bio: '')
      get user_path(@author)
    end

    it('status should be :ok') do
      expect(response).to have_http_status(:ok)
    end

    it('should render :show template') do
      expect(response).to render_template(:show)
    end
  end
end
