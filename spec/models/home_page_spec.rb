require 'rails_helper'

RSpec.describe HomePage, type: :model do
  before(:all) do
    @hp = HomePage.create(heading: "Howdy", summary: "Hello")
  end
  
  it 'is valid with valid attributes' do
    expect(@hp).to be_valid
  end

  it 'is not valid without a heading' do
    @hp.heading = nil
    expect(@hp).not_to be_valid
  end

  it 'is not valid without an summary' do
    @hp.summary = nil
    expect(@hp).not_to be_valid
  end

  it 'is updated properly' do
    @hp.update(:heading => "John Casey")
    @hp.update(:summary => "johncasey@gmail.com")
    expect(HomePage.find_by_heading("John Casey")).to eq(@hp)
  end
  
  it 'is deleted properly' do
    prev = HomePage.count
    @hp.delete
    expect(prev - HomePage.count).to eq(1)
  end
  
end
