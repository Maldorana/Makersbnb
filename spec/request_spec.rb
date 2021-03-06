require 'request'
require 'user'
require 'space'

describe Request do
  describe '.add' do
    it 'adds requests' do
      space = Space.add(name: "Spacename2", description: "Spacedescription2", price: "Spaceprice2", date_start: "20210927", date_start: "202109230")
      user = User.create(email: 'test@test.com', username: 'test12', password: 'test123')
      Request.add(space_id: "#{space.id}", user_id: "#{user.id}", date_start: "20210923", date_end: "20210924")

      requests = Request.list_all

      expect(requests.size).to eq(1)
    end
  end
end