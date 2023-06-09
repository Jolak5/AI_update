RSpec.describe User, type: :model do
    person = User.new(name: "Kayode", photo: "www.google.come", bio: "My name is king")

    it 'name should be correct' do
        expect(person.name).to eq("Kayode")
    end
    it 'photo should be correct' do
        expect(person.photo).to eq("www.google.come")
    end
    it 'bio should be correct' do
        expect(person.bio).to eq("My name is king")
    end
    it 'recent_post to be truthy' do
        expect(person.recent_post).to be_truthy
    end
end