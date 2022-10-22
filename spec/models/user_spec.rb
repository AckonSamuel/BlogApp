require_relative './../rails_helper.rb'

RSpec.describe User, type: :model do
  subject do
    User.new(
        name: 'Stephen Seber', photo: 'https://www.pexels.com/photo/grayscale-photo-of-laughing-woman-holding-her-hat-1054251/',
        bio: 'Hey there, I am Stephen Seber.', posts_counter: 0
    )
  end

  before { subject.save }

    it 'Check if it accept to add a name' do
      subject.name = 'Stephen Seber'
      expect(subject).to be_valid
    end

    it 'Check if it accept posts_counter' do
      subject.posts_counter = 8
      expect(subject).to be_valid
    end

    it 'Check if it disallow blank name input' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'Check if it disallow non numerical posts_counter' do
        subject.posts_counter = 'count'
        expect(subject).to_not be_valid
    end

    it 'Check if it disallow negative posts_counter' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

end