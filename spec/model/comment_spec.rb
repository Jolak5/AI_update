require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:author1) { User.create(name: 'Kayode', photo: 'photo.com', bio: 'Software Developer') }
  let(:author2) { User.create(name: 'Joseph', photo: 'photo.com', bio: 'Advocate for Improvement') }
  let(:post) do
    Post.create(title: 'The Crisis of Modern School System', text: 'The school system is...', author: author1)
  end
  subject { Comment.new(text: "I couldn't agree more!", author: author2) }
  before { subject.save }

  it 'Should validate the rows data' do
    text = subject.text
    expect(text).to eq("I couldn't agree more!")
  end
end
