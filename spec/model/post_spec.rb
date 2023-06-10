require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(author_id: 1, title: 'title', text: 'text', commentsCounter: 0, likesCounter: 0) }

  before { subject.save }

  it 'new post should be saved in the database' do
    expect(subject.new_record?).to be_truthy
  end

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not exceed 250 characters' do
    subject.title = 'a' * 255
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to be_truthy
  end

  it 'commentsCounter should be an integer' do
    subject.commentsCounter = 'a'
    expect(subject).to_not be_valid
  end

  it 'commentsCounter should be greater than or equal to 0' do
    subject.commentsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'likesCounter should be an integer' do
    subject.likesCounter = 'a'
    expect(subject).to_not be_valid
  end

  it 'likesCounter should be greater than or equal to 0' do
    subject.likesCounter = -1
    expect(subject).to_not be_valid
  end
end