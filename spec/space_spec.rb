require 'space'
require 'database_helper'

describe Space do
  describe '.list_all' do
    it 'returns all spaces' do
      space = Space.add(name: "Spacename1", description: "Spacedescription1", price: "Spaceprice1", date_start: "20210927", date_start: "202109230")
      Space.add(name: "Spacename2", description: "Spacedescription2", price: "Spaceprice2", date_start: "20210927", date_start: "202109230")
      Space.add(name: "Spacename3", description: "Spacedescription3", price: "Spaceprice3", date_start: "20210927", date_start: "202109230")
      
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
      space = Space.add(name: "Spacename10", description: "Spacedescription10", price: "Spaceprice10", date_start: "20210927", date_start: "202109230")
      connection = PG.connect(dbname: 'makersbnb_test')
      persisted_data = persisted_data(table: 'spaces', id: space.id)

      expect(space).to be_a(Space)
      expect(space.name).to eq("Spacename10")
      expect(space.description).to eq("Spacedescription10")
      expect(space.price).to eq("Spaceprice10")
      expect(space.id).to eq(persisted_data['id'])
    end
  end

  describe '.find' do
    it 'returns the requested space' do
      space = Space.add(name: "Spacename100", description: "Spacedescription100", price: "Spaceprice100")

      result = Space.find(id: space.id)

      expect(result).to be_a(Space)
      expect(result.name).to eq("Spacename100")
      expect(result.description).to eq("Spacedescription100")
      expect(result.price).to eq("Spaceprice100")
      expect(result.id).to eq(space.id)
    end
  end

  describe '.delete' do
    it 'delete the requested space' do
      space = Space.add(name: "Spacename100", description: "Spacedescription100", price: "Spaceprice100")

      Space.delete(id: space.id)

      expect(Space.list_all.size).to eq(0)
    end
  end
end