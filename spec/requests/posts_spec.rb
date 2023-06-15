require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get user_posts_url(user_id: 1)
      expect(response).to be_successful
    end

    it 'renders correct template' do
      get user_posts_url(user_id: 1)
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      get user_posts_url(user_id: 1)
      expect(response.body).to include('Comment')
    end
    it 'response body includes correct placeholder text' do
      get user_posts_url(user_id: 1)
      expect(response.body).to include('Comment')
    end
  end

  describe 'GET /show' do
    it 'returns a successful response' do
      get user_posts_url(user_id: 1, id: 1)
      expect(response).to be_successful
    end

    it 'renders correct template' do
      get user_post_url(user_id: 1, id: 1)
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder text' do
      get user_post_url(user_id: 1, id: 1)
      expect(response.body).to include('This is the show for posts')
    end
  end
end
