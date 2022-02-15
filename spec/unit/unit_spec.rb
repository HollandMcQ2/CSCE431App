require 'rails_helper'
require 'spec_helper'

RSpec.describe Event, type: :model do
    before(:all) do
        @event= Event.create(name:"First Meeting")
      end
          
      it 'is valid with valid attributes' do
        expect(@event).to be_valid
      end
      it 'edit is valid with valid attributes' do
        @event.update(name:"Second Meeting")
        expect(@event.name).to eq("Second Meeting")
      end
      it 'delete is valid' do
        @event.destroy
        expect(Event.count).to eq(0)
      end
end

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(email:"elainemo0024@gmail.com", full_name:"Elaine Mo")
  end
      
  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end
  it 'edit is valid with valid attributes' do
    @user.update(email:"elainemo24@tamu.edu")
    expect(@user.email).to eq("elainemo24@tamu.edu")
  end
  it 'delete is valid' do
    @user.destroy
    expect(User.count).to eq(0)
  end
end