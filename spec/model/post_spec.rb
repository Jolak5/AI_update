require 'rails_helper'

RSpec.describe Post, type: :model do
  post = Post.new(title: 'Kayode', text: 'www.google.come')

  it 'post should be correct' do
    expect(post.title).to eq('Kayode')
  end
  it 'photo should be correct' do
    expect(post.text).to eq('www.google.come')
  end

  it 'recent_post to be truthy' do
    expect(post.recent_comments).to be_truthy
  end
end
