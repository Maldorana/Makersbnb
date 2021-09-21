require 'database_helper'
require './lib/user'

describe '.create' do 
  it 'creates a new user' do 
    user = User.create(email: 'test@test.com', username: 'test12', password: 'test123')

    persisted_data = persisted_data(table: 'users', id: user.id)

    expect(user).to be_a User 
    expect(user.id).to eq persisted_data['id']
    expect(user.email).to eq 'test@test.com'
    expect(user.username).to eq 'test12'
  end  

  it 'hashes the password using BCrypt' do 
    expect(BCrypt::Password).to receive(:create).with('test123')
    User.create(email: 'test@test.com', username: 'test12', password: 'test123')
  end
    
end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create(email: 'test@test.com', username: 'test12', password: 'test123')
    result = User.find(id: user)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
    expect(result.username).to eq user.username
  end
  it 'returns nil if there is no ID given' do 
    expect(User.find(nil)).to eq nil
  end
end




