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
    puts subject
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end
  
end

RSpec.describe User, type: :model do
  subject do
    described_class.new(email: 'newuser@gmail.com', full_name: 'New User')
  end
  
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  
  it 'is not valid without full name and email' do
    subject.email = nil
    subject.full_name = nil
    expect(subject).not_to be_valid
  end
end