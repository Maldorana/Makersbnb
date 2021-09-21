require 'space'
require 'database_helper'

describe Space do
  describe '.list_all' do
    it 'returns all spaces' do
      space = Space.add(name: "Spacename1", description: "Spacedescription1", price: "Spaceprice1")
      Space.add(name: "Spacename2", description: "Spacedescription2", price: "Spaceprice2")
      Space.add(name: "Spacename3", description: "Spacedescription3", price: "Spaceprice3")
      
      spaces = Space.list_all

      expect(spaces.first).to be_a(Space)
      expect(spaces.size).to eq(3)
      expect(spaces.first.name).to eq("Spacename1")
      expect(spaces.first.description).to eq("Spacedescription1")
      expect(spaces.first.price).to eq("Spaceprice1")
      expect(spaces.first.id).to eq(space.id)
    end
  end

  describe '.add' do
    it 'adds a new space' do
      space = Space.add(name: "Spacename10", description: "Spacedescription10", price: "Spaceprice10")
      connection = PG.connect(dbname: 'makersbnb_test')
      persisted_data = persisted_data(table: 'spaces', id: space.id)

      expect(space).to be_a(Space)
      expect(space.name).to eq("Spacename10")
      expect(space.description).to eq("Spacedescription10")
      expect(space.price).to eq("Spaceprice10")
      expect(space.id).to eq(persisted_data['id'])
    end
  end
end