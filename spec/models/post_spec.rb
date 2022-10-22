require_relative './../rails_helper.rb'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Stephen Seber', photo: 'https://www.pexels.com/photo/grayscale-photo-of-laughing-woman-holding-her-hat-1054251/',
      bio: 'Hey there, I am Stephen Seber.', posts_counter: 0
    )
  end

  subject do
    Post.new(
      title: 'Description', text: 'I am a a passionate photographer', comments_counter: 1,
      likes_counter: 0, user_id: @user.id
    )
  end

  before { subject.save }

    it 'Check if title is valid' do
      subject.title = 'Description'
      expect(subject).to be_valid
    end

    it 'Check if the comments_counter is valid' do
      subject.comments_counter = 1
      expect(subject).to be_valid
    end

    it 'Check if likes_counter is valid' do
      subject.likes_counter = 24
      expect(subject).to be_valid
    end

    it 'Check if it accept more than 200 character as a title' do
        subject.title = '
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula
        eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient
        montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque
        eu, pretium quis,'
        expect(subject).to_not be_valid
    end
  
    it 'Check if it disallow negative comments_counter ' do
        subject.comments_counter = -1
        expect(subject).to_not be_valid
      
    end
  
    it 'Check if it disallow negative likes_counter ' do
        subject.likes_counter = -1
        expect(subject).to_not be_valid
    end
  
    it 'Check if it disallow non numerical value for comments_counter' do
        subject.comments_counter = 'Burundi'
        expect(subject).to_not be_valid
    end

    it 'Check if it disallow non numerical value for likes_counter' do
        subject.likes_counter = 'Microverse'
        expect(subject).to_not be_valid
    end
  
end