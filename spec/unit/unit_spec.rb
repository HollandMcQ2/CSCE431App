require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:all) do
    @event = Event.create(name: "First Meeting")
  end    
  #subject do
    #described_class.new(name: 'First Meeting')
    #subject.update(name: 'Next Meeting')
  #end
  
  it 'is valid with valid attributes' do
    expect(@event).to be_valid
  end

  it 'is not valid without a name' do
    @event.name = nil
    expect(@event).not_to be_valid
  end

  it 'is updated properly' do
    @event.update(:name => "Second Meeting")
    expect(Event.find_by_name("Second Meeting")).to eq(@event)
  end
  
  it 'is deleted properly' do
    prev = Event.count
    @event.delete
    expect(prev - Event.count).to eq(1)
  end
  
end

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(full_name: "John Doe", email: "johndoe@gmail.com")
  end
  
  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'is not valid without a full name' do
    @user.full_name = nil
    expect(@user).not_to be_valid
  end

  it 'is not valid without an email' do
    @user.email = nil
    expect(@user).not_to be_valid
  end

  it 'is updated properly' do
    @user.update(:full_name => "John Casey")
    @user.update(:email => "johncasey@gmail.com")
    expect(User.find_by_full_name("John Casey")).to eq(@user)
  end
  
  it 'is deleted properly' do
    prev = User.count
    @user.delete
    expect(prev - User.count).to eq(1)
  end
  
end