require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Kayode', photo: 'photo.com', bio: 'Full Stack Dev') }
  before :all do
    @first_user = User.create(name: 'Musong', photo: '', bio: 'A web developer')
    @first_user.save
  end

  after :all do
    User.destroy_all
  end

  it "should give the name of user variable's value" do
    puts @first_user.inspect, 'from user spec'
    expect(@first_user.name).to eq('Musong')
    expect(@first_user.bio).to eq('A web developer')
    expect(@first_user.photo).to eq('')
  end

  it 'should print the post 0' do
    expect(@first_user.posts[0]).to be_falsy
  end

  it 'should print the post_counter 0' do
    expect(@first_user.postsCounter).to be_truthy
  end

  describe 'User Validation checks' do
    it 'Name must not be blank' do
      @first_user.name = nil
      expect(@first_user).not_to be_valid
    end

    it 'Posts counter must not be negative' do
      @first_user.postsCounter = -1
      expect(@first_user).not_to be_valid
    end
  end
  it 'recent_post must not be negative' do
    expect(subject.recent_post).not_to be_nil
  end
end
