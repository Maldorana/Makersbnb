require 'request'
require 'user'
require 'space'

describe Request do
  describe '.add' do
    it 'adds requests' do
      space = Space.add(name: "Spacename2", description: "Spacedescription2", price: "Spaceprice2")
      user = User.create(email: 'test@test.com', username: 'test12', password: 'test123')
      Request.add(space_id: "#{space.id}", user_id: "#{user.id}", date: "2010")

      requests = Request.list_all

      expect(requests.size).to eq(1)
    end
  end
end